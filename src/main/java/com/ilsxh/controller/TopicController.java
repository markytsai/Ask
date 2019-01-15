package com.ilsxh.controller;

import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.Topic;
import com.ilsxh.entity.User;
import com.ilsxh.service.*;
import com.ilsxh.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class TopicController {

    private UserHelperService userHelperService;
    private UserService userService;
    private TopicService topicService;

    @Autowired
    public TopicController(UserHelperService userHelperService, UserService userService, TopicService topicService) {
        this.userHelperService = userHelperService;
        this.userService = userService;
        this.topicService = topicService;
    }

    /**
     * 话题页面：简介tab
     *
     * @param topicId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/topic/{topicId}/introduction")
    public String getTopicIntroduction(@PathVariable Integer topicId, HttpServletRequest request, Model model) {

        String userId = userHelperService.getUserIdFromRedis(request);
        topicService.getSideCardInfo(topicId, userId, model);
        topicService.getTopicDetail(topicId, userId, model);
        return "topic/topic-introduction";
    }

    /**
     * 话题页面：相关问题tab
     *
     * @param topicId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/topic/{topicId}/question")
    public String getTopicQuestion(@PathVariable Integer topicId, HttpServletRequest request, Model model) {

        String userId = userHelperService.getUserIdFromRedis(request);
        topicService.getSideCardInfo(topicId, userId, model);

        List<Question> withTopicQuestionList = topicService.getQuestionWithThisTopic(topicId);
        model.addAttribute("withTopicQuestionList", withTopicQuestionList);

        return "topic/topic-question";
    }

    /**
     * 话题页面：相关回答tab
     *
     * @param topicId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/topic/{topicId}/answer")
    public String getTopicExAnswer(@PathVariable Integer topicId, HttpServletRequest request, Model model) {

        String localUserId = userService.getUserIdFromRedis(request);
        topicService.getSideCardInfo(topicId, localUserId, model);

        List<Answer> answerList = topicService.getAnswersByTopicId(localUserId, topicId);
        model.addAttribute("answerList", answerList);

        return "topic/topic-exAnswer";
    }

    /**
     * 话题页面：话题相关热门用户tab
     *
     * @param topicId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/topic/{topicId}/users")
    public String getTopicExcellentUsers(@PathVariable Integer topicId, HttpServletRequest request, Model model) {

        String localUserId = userService.getUserIdFromRedis(request);
        topicService.getSideCardInfo(topicId, localUserId, model);

        List<User> excellentUserList = topicService.getExcellentUsersByTopicId(topicId);
        model.addAttribute("ExcellentUserList", excellentUserList);

        return "topic/topic-user";
    }

    @RequestMapping("/getProbablyRelativeTopics/{partialWord}")
    @ResponseBody
    public Response getProbablyRelativeTopics(@PathVariable String partialWord) {
        List<Topic> topicList = topicService.getProbablyRelativeTopics(partialWord);
        return new Response(1, "相关话题", topicList);
    }

    @RequestMapping("/followTopic/{topicId}")
    @ResponseBody
    public Response followTopic(@PathVariable Integer topicId, HttpServletRequest request) {

        String localUserId = userService.getUserIdFromRedis(request);
        Integer opRetStat = topicService.followTopic(localUserId, topicId);
        return new Response(opRetStat, "", "");
    }

    @RequestMapping("/unfollowTopic/{topicId}")
    @ResponseBody
    public Response unfollowTopic(@PathVariable Integer topicId, HttpServletRequest request) {

        String localUserId = userService.getUserIdFromRedis(request);
        Integer opRetStat = topicService.unfollowTopic(localUserId, topicId);
        return new Response(opRetStat, "", "");
    }
}
