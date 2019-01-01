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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 关于用户设置，详情的控制器
 */

@Controller
//@RequestMapping("/")
public class IndexController {

    @Autowired
    private UserService userService;

    @Autowired
    private IndexService indexService;

    @Autowired
    private QuestionService questionService;

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
        return "editProfile";
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
     * update user's avatar
     *
     * @param paramName
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/updateAvatarUrl")
    public String updateAvatarUrl(MultipartFile paramName, HttpServletRequest request) throws IOException {
        String userId = userService.getUserIdFromRedis(request);

        // 包含原始文件名的字符串
        String fi = paramName.getOriginalFilename();
        // 提取文件拓展名
        String fileNameExtension = fi.substring(fi.indexOf("."), fi.length());
        // 生成云端的真实文件名
//        String remoteFileName = UUID.randomUUID().toString() + fileNameExtension;
//        QiniuyunUtil.upload(paramName.getBytes(), remoteFileName);
        // 返回图片的URL地址
        String avatarUrl = MyUtil.AVATAR_BASE_DIR + userId + ".jpg";
        MyUtil.saveToLocal(paramName.getBytes(), avatarUrl);

        indexService.updateAvatarUrl(userId, avatarUrl);
        return "redirect:/profile/" + userId;
    }

    /**
     * user home page with activity tab
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
     * user home page with answer tab
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
     * user home page with question tab
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
     * 获取用户主页的关注用户
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
