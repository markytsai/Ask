package com.ilsxh.controller;

import com.ilsxh.dao.QuestionDao;
import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import com.ilsxh.service.HotService;
import com.ilsxh.service.IndexService;
import com.ilsxh.service.QuestionService;
import com.ilsxh.service.UserService;
import com.ilsxh.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.util.StringUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static com.ilsxh.service.UserService.COOKIE_NAME_TOKEN;

@Controller
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private UserService userService;

    @Autowired
    private QuestionDao questionDao;

    @Autowired
    private IndexService indexService;

    @Autowired
    private JedisPool jedisPool;

    @Autowired
    private UserDao userDao;

    @Autowired
    private HotService hotService;

    @RequestMapping("/following")
    public String getFollowingQuestionsByUserId(HttpServletRequest request, Model model) {

        String loginToken = null;

        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(COOKIE_NAME_TOKEN)) {
                loginToken = cookie.getValue();
            }
        }

        String userId = null;
        if (!StringUtils.isEmpty(loginToken)) {
            Jedis jedis = jedisPool.getResource();
            userId = jedis.get(loginToken);
            jedis.close();
            model.addAttribute("user", userDao.selectUserByUserId(userId));
            model.addAttribute("username", userDao.selectUsernameByUserId(userId));
        }

        List<Question> questionList = questionService.getFollowingQuestionByUserId(userId);
        model.addAttribute("questionList", questionList);
        model.addAttribute("hotQuestions", hotService.getHotQuestion());
        model.addAttribute("hotUsers", hotService.getHotUsers());
        model.addAttribute("hotTopics", hotService.getHotTopic());
        model.addAttribute("newestQuestions", hotService.getNewestRaisedQuestion());
        return "index";
    }

    /**
     * 问题详情页面
     *
     * @param questionId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/question/{questionId}")
    public String QuestionDetail(@PathVariable("questionId") String questionId, HttpServletRequest request, Model model) {

        String userId = userService.getUserIdFromRedis(request);
        User user = indexService.getProfileInfo(userId);
        String hasFollowQuestion = questionService.hasUserFollowQuestion(userId, questionId);

        List<Answer> answerList = questionService.getAnswersByQuestionId(questionId, userId);
        Question question = questionService.getQuestionByQuestionid(questionId);

        model.addAttribute("user", user);
        model.addAttribute("hasFollowQuestion", hasFollowQuestion);
        model.addAttribute("answerList", answerList);
        model.addAttribute("questionDetail", question);
        model.addAttribute("hotQuestions", hotService.getHotQuestion());
        model.addAttribute("hotUsers", hotService.getHotUsers());
        model.addAttribute("hotTopics", hotService.getHotTopic());
        model.addAttribute("newestQuestions", hotService.getNewestRaisedQuestion());
        return "questionDetail";
    }

    /**
     * 关注问题页面
     *
     * @param questionId
     * @param request
     */
    @RequestMapping("/followQuestion/{questionId}")
    public void followQuestion(@PathVariable("questionId") String questionId, HttpServletRequest request) {

        String localUserId = userService.getUserIdFromRedis(request);

        String hasUserFollowQuestion = questionService.hasUserFollowQuestion(localUserId, questionId);

        Integer effectRow = null;
        if (hasUserFollowQuestion != null && hasUserFollowQuestion == "true") {
            questionService.unfollowQuestion(localUserId, questionId);
        } else {
            questionService.followQuestion(localUserId, questionId);
        }

        return;
    }

    /**
     * 回答提交
     *
     * @param answerContent
     * @param questionId
     * @param request
     */
    @RequestMapping("/submitAnswer/{questionId}")
    public void submitAnswer(@RequestParam("answerContent") String answerContent, @PathVariable("questionId") String questionId, HttpServletRequest request) {

        String localUserId = userService.getUserIdFromRedis(request);

        questionService.submitAnswer(localUserId, answerContent, questionId);
    }

    /**
     * 此处链接不应该跳转，bug to fix
     *
     * @param answerId
     * @param request
     */
    @RequestMapping("/deleteAnswer/{answerId}")
    public void deleteAnswer(@PathVariable("answerId") String answerId, HttpServletRequest request) {

        String localUserId = userService.getUserIdFromRedis(request);

        questionService.deleteAnswer(answerId);
    }

    /**
     * 提问题
     *
     * @param questionTitle
     * @param questionContent
     */
    @RequestMapping(value = "/addQuestion", method = RequestMethod.POST)
    @ResponseBody
    public Response askQuestion(@RequestParam String questionTitle, @RequestParam String questionContent, HttpServletRequest request) {
        String userId = userService.getUserIdFromRedis(request);
        Question question = new Question();
        question.setQuestionTitle(questionTitle);
        question.setQuestionContent(questionContent);
        question.setUserId(userId);

        questionService.addQuestion(question, userId);
        return new Response(1, "", question.getQuestionId());
    }

}



