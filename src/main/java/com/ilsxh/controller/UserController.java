package com.ilsxh.controller;

import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import com.ilsxh.service.QuestionService;
import com.ilsxh.service.UserService;
import com.ilsxh.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping
public class UserController {

    private static final Integer LOGIN_SUCCESS = 1;
    private static final Integer LOGIN_FAILURE = 0;
    private static final Integer REGISTER_SUCCESS = 1;
    private static final Integer REGISTER_FAILURE = 0;


    @Autowired
    private UserService userService;

    @Autowired
    private QuestionService questionService;

    @RequestMapping(value = "/toLogin")
    @ResponseBody
    public Response login(@RequestParam("email") String email, @RequestParam("password") String password,
                          @RequestParam("rememberMe") Boolean rememberMe, HttpServletRequest request, HttpServletResponse response) {

        Map<String, Object> userInfoMap = userService.login(email, password, rememberMe, response);

        if (userInfoMap.get("loginError") == null) {
            return new Response(LOGIN_SUCCESS, "", userInfoMap);
        } else {
            return new Response(LOGIN_FAILURE, userInfoMap.get("loginError").toString());
        }
    }

    @ResponseBody
    @RequestMapping(value = "/doRegister")
    public Response register(@RequestParam("email") String email, @RequestParam("username") String username,
                             @RequestParam("password") String password, HttpServletResponse response) {
        Map<String, Object> userInfoMap = userService.registerNewUser(email, username, password, response);
        if (userInfoMap.get("errorInfo") == null) {
            return new Response(REGISTER_SUCCESS, "", userInfoMap);
        } else {
            return new Response(REGISTER_FAILURE, userInfoMap.get("errorInfo").toString());
        }
    }


    @RequestMapping("/followUser/{userIdToBeFollowed}")
    @ResponseBody
    public Response followUser(@PathVariable String userIdToBeFollowed, HttpServletRequest request) {
        String localUserId = userService.getUserIdFromRedis(request);
        userService.followUser(localUserId, userIdToBeFollowed, new Date().getTime());
        return new Response(1, "你已成功关注此用户", "");
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        userService.logout(request, response);
        return "redirect:/login";
    }

    @RequestMapping("/touristLogin")
    public String touristLogin(HttpServletRequest request, HttpServletResponse response) {
        return "redirect:/recommend";
    }

    @RequestMapping("/getUser/{userId}")
    @ResponseBody
    public Response getUser(@PathVariable String userId, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        User user = userService.getUserByUserId(userId);
        String localUserId = userService.getUserIdFromRedis(request);

        Integer isExistFollowStatus = userService.selectUserByUserIdWithFollowingStatus(userId, localUserId);
        user.setFollowStatus(isExistFollowStatus == null ? 0 : isExistFollowStatus);

        map.put("user", user);
        map.put("localUserId", localUserId);

        if (user != null) {
            return new Response(1, "成功获取用户信息", map);
        }
        return new Response(1, "获取用户信息失败", map);
    }


}