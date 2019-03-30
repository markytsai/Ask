package com.ilsxh.controller;

import com.ilsxh.entity.*;
import com.ilsxh.enums.StatusEnum;
import com.ilsxh.response.BaseResponse;
import com.ilsxh.service.*;
import com.ilsxh.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 关于用户设置，详情的控制器
 */

@Controller
public class IndexController {

    private UserService userService;
    private IndexService indexService;
    private QuestionService questionService;
    private UserHelperService userHelperService;
    private TopicService topicService;

    @Autowired
    public IndexController(UserService userService, IndexService indexService, QuestionService questionService,
                           UserHelperService userHelperService, TopicService topicService) {
        this.userService = userService;
        this.indexService = indexService;
        this.questionService = questionService;
        this.userHelperService = userHelperService;
        this.topicService = topicService;
    }

    /**
     * 跳转到用户信息设置页面
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/user/settings")
    public String setting(HttpServletRequest request, Model model) {
        String userId = userHelperService.getUserIdFromRedis(request);
        userHelperService.getUserDetails(userId, model);
        return "setting/updateProfile";
    }

    /**
     * 获取用户偏好，修改用户偏好
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/user/preference")
    public String preference(HttpServletRequest request, Model model) {
        String userId = userHelperService.getUserIdFromRedis(request);
        model = userHelperService.getUserDetails(userId, model);

        List<Topic> topicList = topicService.getPreference(userId);
        model.addAttribute("topicList", topicList);

        return "setting/preference";
    }

    /**
     * 用户个人信息修改
     *
     * @param user
     * @param request
     * @return
     */
    @RequestMapping("/editProfile")
    public String editProfile(User user, HttpServletRequest request, Model model) {
        String userId = userHelperService.getUserIdFromRedis(request);
        user.setUserId(userId);

        indexService.updateProfile(user);
        model.addAttribute("user", user);
        return "redirect:/userHome/activity/" + user.getUserId();
    }

    /**
     * 更新登陆密码
     *
     * @param password
     * @param newpassword
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/updatePassword")
    public String updatePassword(String password, String newpassword, HttpServletRequest request, Model model) {
        String userId = userHelperService.getUserIdFromRedis(request);
        Map<String, String> map = indexService.updatePassword(userId, password, newpassword);
        if (map.get("error") != null) {
            model.addAttribute("error", map.get("error"));
            return "forward:/setting";
        }
        return "redirect:/logout";

    }

    /**
     * 个人主页-动态列表tab
     *
     * @param userId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/userHome/activity/{userId}")
    public String userHomeActivity(@PathVariable String userId, @RequestParam(value = "page", defaultValue = "1") Integer pageNo,  HttpServletRequest request, Model model) {
        String localUserId = userHelperService.getUserIdFromRedis(request);
        // 获取用户信息,userId from parameter, localhost from token
        Map<String, Object> map = userHelperService.getUserProfile(userId, localUserId);

        // 获取动态列表
        List<Activity> activityList = indexService.getActivityByUserId(userId);
        Page<Activity> page = new Page<>(0, 5, 20, activityList);

        map.put("activityList", activityList);
        map.put("page", page);
        map.put("type", "activity");
        model.addAllAttributes(map);

        return "user/userHome-activity";
    }

    /**
     * 个人主页-回答列表tab
     *
     * @param userId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/userHome/answer/{userId}")
    public String userHomeAnswer(@PathVariable String userId, @RequestParam(value = "page", defaultValue = "1") Integer pageNo, HttpServletRequest request, Model model) {
        String localUserId = userHelperService.getUserIdFromRedis(request);
        // 获取用户信息,userId from parameter, localhost from token
        Map<String, Object> map = userHelperService.getUserProfile(userId, localUserId);

        // 获取回答列表
        Page<Answer> page = userService.getAnswersByUserId(userId, pageNo);

        map.put("type", "answer");
        model.addAllAttributes(map);
        model.addAttribute("page", page);

        return "user/userHome-answer";
    }


    /**
     * 个人主页-提出的问题列表tab
     *
     * @param userId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/userHome/question/{userId}")
    public String userHomeRaisedQuestion(@PathVariable String userId, @RequestParam(value = "page", defaultValue = "1") Integer pageNo, HttpServletRequest request, Model model) {

        String localUserId = userHelperService.getUserIdFromRedis(request);
        // 获取用户信息,userId from parameter, localhost from token
        Map<String, Object> map = userHelperService.getUserProfile(userId, localUserId);

        // 获取提问列表
        Page<Question> page = questionService.getRaisedQuestionByUserId(userId, pageNo);
        map.put("page", page);
        map.put("type", "question");
        model.addAllAttributes(map);

        return "user/userHome-question";
    }

    /**
     * 个人主页-关注问题列表tab
     *
     * @param userId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/userHome/followingQuestion/{userId}")
    public String userHomeFollowingQuestion(@PathVariable String userId, @RequestParam(value = "page", defaultValue = "1") Integer pageNo, HttpServletRequest request, Model model) {
        String localUserId = userHelperService.getUserIdFromRedis(request);
        // 获取用户信息,userId from parameter, localhost from token
        Map<String, Object> map = userHelperService.getUserProfile(userId, localUserId);

        int pageSize = 30;
        // 获取关注问题列表
        List<Question> questionList = questionService.getFollowingQuestionByUserId(userId, pageNo, pageSize);
        int totalCount = questionService.getTotalQuestionNum(userId);
        Page<Question> page = new Page<>(pageNo, pageSize, totalCount, questionList);

        map.put("page", page);
        map.put("type", "followingQuestion");

        model.addAllAttributes(map);

        return "user/userHome-following-question";
    }

    /**
     * 个人主页-关注用户列表tab
     *
     * @param userId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/userHome/followingUser/{userId}")
    public String userHomeFollowingUser(@PathVariable String userId, @RequestParam(value = "page", defaultValue = "1") Integer pageNo, HttpServletRequest request, Model model) {
        String localUserId = userHelperService.getUserIdFromRedis(request);
        // 获取用户信息,userId from parameter, localhost from token
        Map<String, Object> map = userHelperService.getUserProfile(userId, localUserId);

        // 获取关注用户列表
        Page<User> page = userService.getollowingUserByUserId(userId, pageNo);
        map.put("page", page);
        map.put("type", "followingUser");
        model.addAllAttributes(map);

        return "user/userHome-following-user";
    }

    @RequestMapping("/userHome/followingTopic/{userId}")
    public String userHomeFollowingTopic(@PathVariable String userId, @RequestParam(value = "page", defaultValue = "1") Integer pageNo,HttpServletRequest request, Model model) {
        String localUserId = userHelperService.getUserIdFromRedis(request);
        // 获取用户信息,userId from parameter, localhost from token
        Map<String, Object> map = userHelperService.getUserProfile(userId, localUserId);

        Page<Topic> page = topicService.getFollowingTopicByUserId(userId, pageNo);
        map.put("page", page);
        map.put("type", "followingTopic");
        model.addAllAttributes(map);
        return "user/userHome-following-topic";
    }

    /**
     * 更新头像
     *
     * @param request
     * @param img
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadAvatar", headers = ("content-type=multipart/*"), method = RequestMethod.POST)
    @ResponseBody
    public BaseResponse springUpload(HttpServletRequest request, @RequestParam("file") MultipartFile img) throws Exception {
        String localUserId = userHelperService.getUserIdFromRedis(request);

        String avatar = "userId-avatar-" + localUserId + "-" + img.getOriginalFilename();
        QiniuyunUtil.uploadAvatar(img, avatar);
        Integer updEffectRow = indexService.updateAvatarUrl(localUserId, "http://pknhrkp8l.bkt.clouddn.com/" + avatar);

        if (updEffectRow != null && updEffectRow == 1) {
            return new BaseResponse(StatusEnum.SUCCESS.getCode(), "成功上传头像", "");
        } else {
            return new BaseResponse(StatusEnum.OPERATION_ERROR.getCode(), "上传头像失败", "");
        }
    }
}
