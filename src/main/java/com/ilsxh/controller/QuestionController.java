package com.ilsxh.controller;

import com.ilsxh.dao.QuestionDao;
import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import com.ilsxh.redis.AnswerKey;
import com.ilsxh.service.RedisService;
import com.ilsxh.service.HotService;
import com.ilsxh.service.IndexService;
import com.ilsxh.service.QuestionService;
import com.ilsxh.service.UserService;
import com.ilsxh.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

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
    private UserDao userDao;

    @Autowired
    private HotService hotService;

    @Autowired
    private RedisService redisService;

    @RequestMapping("/following")
    public String getFollowingQuestionsByUserId(HttpServletRequest request, Model model) {

        String userId = userService.getUserIdFromRedis(request);
        model.addAttribute("user", userDao.selectUserByUserId(userId));
        model.addAttribute("username", userDao.selectUsernameByUserId(userId));

        List<Question> questionList = questionService.getFollowingQuestionByUserId(userId);
        model.addAttribute("questionList", questionList);
        model.addAttribute("hotQuestions", hotService.getHotQuestion());
        model.addAttribute("hotUsers", hotService.getHotUsers());
        model.addAttribute("hotTopics", hotService.getHotTopic());
        model.addAttribute("newestQuestions", hotService.getNewestRaisedQuestion());
        return "index-following";
    }

    /**
     * 推荐问题接口
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/recommend")
    public String getRecommendQuestionsByUserId(HttpServletRequest request, Model model) {

        String userId = userService.getUserIdFromRedis(request);
        model.addAttribute("user", userDao.selectUserByUserId(userId));
        model.addAttribute("username", userDao.selectUsernameByUserId(userId));

        List<Question> questionList = questionService.getRecommendedQuestionByUserId();
        model.addAttribute("recommendQuestionList", questionList);
        model.addAttribute("hotQuestions", hotService.getHotQuestion());
        model.addAttribute("hotUsers", hotService.getHotUsers());
        model.addAttribute("hotTopics", hotService.getHotTopic());
        model.addAttribute("newestQuestions", hotService.getNewestRaisedQuestion());
        return "index-recommend";
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
    public String QuestionDetail(@PathVariable("questionId") Integer questionId, HttpServletRequest request, Model model) {

        String userId = userService.getUserIdFromRedis(request);
        User user = indexService.getProfileInfo(userId);
        String hasFollowQuestion = questionService.hasUserFollowQuestion(userId, questionId);

        List<Answer> answerList = questionService.getAnswersByQuestionId(questionId, userId);
        Question question = questionService.getQuestionByQuestionid(questionId);

        Integer localUserAnswerId = indexService.isQuestionAnswered(userId, questionId);
        model.addAttribute("user", user);
        model.addAttribute("localUserAnswer", localUserAnswerId);

//        redisService.set(AnswerKey.answerKey, "-" + questionId, localUserAnswerId);

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
    public void followQuestion(@PathVariable("questionId") Integer questionId, HttpServletRequest request) {

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
    @ResponseBody
    public Response submitAnswer(@RequestParam("answerContent") String answerContent, @PathVariable("questionId") Integer questionId, HttpServletRequest request) {

        String localUserId = userService.getUserIdFromRedis(request);

        Answer answer = new Answer();
        answer.setAnswerUserId(localUserId);
        answer.setAnswerContent(answerContent);
        answer.setQuestionId(questionId);
        answer.setCreateTime(new Date().getTime());

        questionService.submitAnswer(answer);

        redisService.set(AnswerKey.answerKey, "-" + localUserId + "-" + questionId, answer.getAnswerId());
        return new Response(1, "已成功提交你的回答", answer.getAnswerId());
    }


    @RequestMapping("/updateAnswer/{questionId}")
    @ResponseBody
    public Response updateAnswer(@RequestParam("answerContent") String answerContent, @RequestParam("answerId") Integer answerId, @PathVariable("questionId") Integer questionId, HttpServletRequest request) {

        String localUserId = userService.getUserIdFromRedis(request);

        questionService.updateAnswer(localUserId, answerId, answerContent, questionId);
        return new Response(1, "", "");
    }

    /**
     * 此处链接不应该跳转，bug to fix
     *
     * @param answerId
     * @param request
     */
    @RequestMapping("/deleteAnswer/{answerId}")
    @ResponseBody
    public Response deleteAnswer(@PathVariable("answerId") String answerId, HttpServletRequest request) {
//        String localUserId = userService.getUserIdFromRedis(request);

        questionService.deleteAnswer(answerId);
//        redisService.decr(AnswerKey.answerKey)
        return new Response(1, "", "");
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
        question.setCreateTime(new Date().getTime());

        questionService.addQuestion(question, userId);
        questionService.followQuestion(userId, question.getQuestionId());
        return new Response(1, "", question.getQuestionId());
    }

}



