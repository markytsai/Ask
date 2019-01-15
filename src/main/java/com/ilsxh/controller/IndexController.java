package com.ilsxh.controller;

import com.ilsxh.entity.Activity;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import com.ilsxh.service.IndexService;
import com.ilsxh.service.QuestionService;
import com.ilsxh.service.UserService;
import com.ilsxh.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
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

    @Autowired
    public IndexController(UserService userService, IndexService indexService, QuestionService questionService) {
        this.userService = userService;
        this.indexService = indexService;
        this.questionService = questionService;
    }

    /**
     * 跳转到用户信息设置页面
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/settings")
    public String setting(HttpServletRequest request, Model model) {
        String userId = userService.getUserIdFromRedis(request);
        User user = indexService.getProfileInfo(userId);
        model.addAttribute("user", user);
        System.out.println();
        return "setting/updateProfile";
//        return "editProfile";
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
        String userId = userService.getUserIdFromRedis(request);
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
        String userId = userService.getUserIdFromRedis(request);
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
    public String userHomeActivity(@PathVariable String userId, HttpServletRequest request, Model model) {
        String localUserId = userService.getUserIdFromRedis(request);
        // 获取用户信息,userId from parameter, localhost from token
        Map<String, Object> map = userService.getUserProfile(userId, localUserId);

        // 获取动态列表
        List<Activity> activityList = indexService.getActivityByUserId(userId);
        map.put("activityList", activityList);
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
    public String userHomeAnswer(@PathVariable String userId, HttpServletRequest request, Model model) {
        String localUserId = userService.getUserIdFromRedis(request);
        // 获取用户信息,userId from parameter, localhost from token
        Map<String, Object> map = userService.getUserProfile(userId, localUserId);

        // 获取回答列表
        List<Answer> answerList = userService.getAnswersByUserId(userId);
        map.put("answerList", answerList);
        model.addAllAttributes(map);

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
    public String userHomeRaisedQuestion(@PathVariable String userId, HttpServletRequest request, Model model) {

//        model.addAttribute("user", userDao.selectUserByUserId(userId));

        String localUserId = userService.getUserIdFromRedis(request);
        // 获取用户信息,userId from parameter, localhost from token
        Map<String, Object> map = userService.getUserProfile(userId, localUserId);

        // 获取提问列表
        List<Question> questionList = questionService.getRaisedQuestionByUserId(userId);
        map.put("questionList", questionList);

        model.addAllAttributes(map);

        return "user/userHome-question";
    }

    /**
     * 个人主页-关注问题列表tab
     * @param userId
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/userHome/followingQuestion/{userId}")
    public String userHomeFollowingQuestion(@PathVariable String userId, HttpServletRequest request, Model model) {
        String localUserId = userService.getUserIdFromRedis(request);
        // 获取用户信息,userId from parameter, localhost from token
        Map<String, Object> map = userService.getUserProfile(userId, localUserId);

        // 获取关注问题列表
        List<Question> questionList = questionService.getFollowingQuestionByUserId(userId);
        map.put("questionList", questionList);

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
    public String userHomeFollowingUser(@PathVariable String userId, HttpServletRequest request, Model model) {
        String localUserId = userService.getUserIdFromRedis(request);
        // 获取用户信息,userId from parameter, localhost from token
        Map<String, Object> map = userService.getUserProfile(userId, localUserId);

        // 获取关注用户列表
        List<User> followingUserList = userService.getollowingUserByUserId(userId);
        map.put("followingUserList", followingUserList);

        model.addAllAttributes(map);

        return "user/userHome-following-user";
    }

    /**
     * 更新头像
     * @param request
     * @param img
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadAvatar", headers = ("content-type=multipart/*"), method = RequestMethod.POST)
    @ResponseBody
    public Response springUpload(HttpServletRequest request, @RequestParam("file") MultipartFile img) throws Exception {
        String localUserId = userService.getUserIdFromRedis(request);

        String avatar = "userId-avatar-" + localUserId + "-" + img.getOriginalFilename();
        QiniuyunUtil.uploadAvatar(img, avatar);
        indexService.updateAvatarUrl(localUserId, "http://pknhrkp8l.bkt.clouddn.com/" + avatar);

        return new Response(1, "", "");
    }
}
