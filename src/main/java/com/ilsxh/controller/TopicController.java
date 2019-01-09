package com.ilsxh.controller;

import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.Topic;
import com.ilsxh.entity.User;
import com.ilsxh.service.HotService;
import com.ilsxh.service.QuestionService;
import com.ilsxh.service.TopicService;
import com.ilsxh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class TopicController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private UserService userService;

    @Autowired
    private TopicService topicService;

    /**
     * 话题页面：简介tab
     * @param topicId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/topic/{topicId}/introduction")
    public String getTopicIntroduction(@PathVariable Integer topicId, HttpServletRequest request, Model model) {

        topicService.getSideCardInfo(topicId, request, model);

        model.addAttribute("hasFollowQuestion", questionService.hasUserFollowQuestion(userService.getUserIdFromRedis(request), 1));
        model.addAttribute("localUserAnswer", 0);

        return "topic/topic-introduction";
    }

    /**
     * 话题页面：相关问题tab
     * @param topicId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/topic/{topicId}/question")
    public String getTopicQuestion(@PathVariable Integer topicId, HttpServletRequest request, Model model) {

        topicService.getSideCardInfo(topicId, request, model);

        List<Question> withTopicQuestionList = topicService.getQuestionWithThisTopic(topicId);
        model.addAttribute("withTopicQuestionList", withTopicQuestionList);

        return "topic/topic-question";
    }

    /**
     * 话题页面：相关回答tab
     * @param topicId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/topic/{topicId}/answer")
    public String getTopicExAnswer(@PathVariable Integer topicId, HttpServletRequest request, Model model) {

        String localUserId = userService.getUserIdFromRedis(request);
        topicService.getSideCardInfo(topicId, request, model);

        List<Answer> answerList = topicService.getAnswersByTopicId(localUserId, topicId);
        model.addAttribute("answerList", answerList);

        return "topic/topic-exAnswer";
    }

    /**
     * 话题页面：话题相关热门用户tab
     * @param topicId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/topic/{topicId}/users")
    public String getTopicExcellentUsers(@PathVariable Integer topicId, HttpServletRequest request, Model model) {

        String localUserId = userService.getUserIdFromRedis(request);
        topicService.getSideCardInfo(topicId, request, model);

        List<User> excellentUserList = topicService.getExcellentUsersByTopicId(topicId);
        model.addAttribute("ExcellentUserList", excellentUserList);

        return "topic/topic-user";
    }
}
