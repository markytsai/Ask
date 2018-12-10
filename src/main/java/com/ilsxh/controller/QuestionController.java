package com.ilsxh.controller;

import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import com.ilsxh.service.IndexService;
import com.ilsxh.service.QuestionService;
import com.ilsxh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
    private IndexService indexService;

    @Autowired
    private JedisPool jedisPool;

    @Autowired
    private UserDao userDao;

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
        return "index";
    }

    @RequestMapping("/question/{questionId}")
    public String QuestionDetail(@PathVariable("questionId") String questionId, HttpServletRequest request, Model model) {

        String userId = userService.getUserIdFromRedis(request);
        User user = indexService.getProfileInfo(userId);

        List<Answer> answerList = questionService.getAnswersByQuestionId(questionId);
        Question question = questionService.getQuestionByQuestionid(questionId);

        model.addAttribute("user", user);
        model.addAttribute("answerList", answerList);
        model.addAttribute("questionDetail", question);
        return "questionDetail";
    }
}



