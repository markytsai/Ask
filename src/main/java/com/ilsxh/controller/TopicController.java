package com.ilsxh.controller;

import com.ilsxh.enums.StatusEnum;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.Topic;
import com.ilsxh.entity.User;
import com.ilsxh.response.BaseResponse;
import com.ilsxh.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.thymeleaf.expression.Sets;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

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
        model.addAttribute("currentUrl", "/topic/" + topicId + "/introduction");
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
        model.addAttribute("currentUrl", "/topic/" + topicId + "/question");

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

        String localUserId = userHelperService.getUserIdFromRedis(request);
        topicService.getSideCardInfo(topicId, localUserId, model);

        List<Answer> answerList = topicService.getAnswersByTopicId(localUserId, topicId);
        model.addAttribute("answerList", answerList);
        model.addAttribute("currentUrl", "/topic/" + topicId + "/answer");

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

        String localUserId = userHelperService.getUserIdFromRedis(request);
        topicService.getSideCardInfo(topicId, localUserId, model);

        List<User> excellentUserList = topicService.getExcellentUsersByTopicId(topicId);
        model.addAttribute("ExcellentUserList", excellentUserList);
        model.addAttribute("currentUrl", "/topic/" + topicId + "/users");
        return "topic/topic-user";
    }

    @RequestMapping("/getProbablyRelativeTopics/{partialWord}")
    @ResponseBody
    public BaseResponse getProbablyRelativeTopics(@PathVariable String partialWord) {
        List<Topic> topicList = topicService.getProbablyRelativeTopics(partialWord);
        if (topicList != null) {
            return new BaseResponse(StatusEnum.SUCCESS.getCode(), "问题发布成功", topicList);
        } else {
            return new BaseResponse(StatusEnum.FAIL.getCode(), "获取相关话题失败", "");
        }
    }

    @RequestMapping("/followTopic/{topicId}")
    @ResponseBody
    public BaseResponse followTopic(@PathVariable Integer topicId, HttpServletRequest request) {

        String localUserId = userHelperService.getUserIdFromRedis(request);
        Integer opRetStat = topicService.followTopic(localUserId, topicId);
        if (opRetStat != null && opRetStat == 1) {
            return new BaseResponse(StatusEnum.SUCCESS.getCode(), "成功获取登录用户与被访问用户的关注关系", "");
        } else {
            return new BaseResponse(StatusEnum.FAIL.getCode(), "未能获取登录用户与被访问用户的关注关系", "");
        }
    }

    @RequestMapping("/unfollowTopic/{topicId}")
    @ResponseBody
    public BaseResponse unfollowTopic(@PathVariable Integer topicId, HttpServletRequest request) {

        String localUserId = userHelperService.getUserIdFromRedis(request);
        Integer opRetStat = topicService.unfollowTopic(localUserId, topicId);
        if (opRetStat != null && opRetStat == 1) {
            return new BaseResponse(StatusEnum.SUCCESS.getCode(), "成功获取登录用户与话题之间的关注关系", "");
        } else {
            return new BaseResponse(StatusEnum.FAIL.getCode(), "未能获取登录用户与话题之间的关注关系", "");
        }
    }

    /**
     * 获取 话题选择页面
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/chooseTopic")
    public String chooseTopic(HttpServletRequest request, Model model) {

        String userId = userHelperService.getUserIdFromRedis(request);
        userHelperService.getUserDetails(userId, model);

        List<Topic> topicList = topicService.getAllTopics();
        model.addAttribute("topicList", topicList);

        return "chooseLikedTopic";
    }

    /**
     * 将用户的话题偏好持久化
     *
     * @param request
     * @param topicIds
     */
    @RequestMapping("/doChooseTopic")
    @ResponseBody
    public BaseResponse<String> saveChosenTopics(HttpServletRequest request, @RequestParam(value = "topicIds[]") Integer[] topicIds, Model model) {

        String userId = userHelperService.getUserIdFromRedis(request);
        userHelperService.getUserDetails(userId, model);
        topicService.insertUserFollowTopics(userId, Arrays.asList(topicIds));

        return new BaseResponse<>("1", "成功保存用户话题偏好");
    }

    @RequestMapping("/doUpdateTopic")
    @ResponseBody
    public BaseResponse<String> updateChosenTopics(HttpServletRequest request, @RequestParam(value = "topicIds[]") Integer[] topicIds, Model model) {

        String userId = userHelperService.getUserIdFromRedis(request);
        userHelperService.getUserDetails(userId, model);
        topicService.updateUserFollowTopics(userId, new HashSet(Arrays.asList(topicIds)));

        return new BaseResponse<>("1", "成功保存用户话题偏好");
    }


    @RequestMapping("/getSocialScienceTopics/{rootTopicId}")
    @ResponseBody
    public BaseResponse<String> getSocialScienceTopics(@PathVariable Integer rootTopicId, HttpServletRequest request, Model model) {
        String userId = userHelperService.getUserIdFromRedis(request);
        userHelperService.getUserDetails(userId, model);

        Map<String, List<Topic>> subTopicMap = topicService.getSocialScienceTopics(userId, rootTopicId);

        return new BaseResponse("1", "", subTopicMap);

    }
}
