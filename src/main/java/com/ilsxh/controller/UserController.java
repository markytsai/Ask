package com.ilsxh.controller;

import com.ilsxh.entity.Answer;
import com.ilsxh.service.AnswerService;
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
    private AnswerService answerService;

    @RequestMapping(value = "/toLogin")
    @ResponseBody
    public Response login(@RequestParam("email") String email, @RequestParam("password") String password,
                          HttpServletRequest request, HttpServletResponse response) {

        Map<String, Object> userInfoMap = userService.login(email, password, response);

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

    @RequestMapping("/userProfile/{userId}")
    public String profile(@PathVariable String userId, Integer page, HttpServletRequest request, Model model) {
        String localUserId = userService.getUserIdFromRedis(request);
        // 获取用户信息,userId from parameter, localhost from token
        Map<String, Object> map = userService.getUserProfile(userId, localUserId);

        // 获取回答列表
        List<Answer> answerList = answerService.getAnswersByUserId(userId);
        map.put("answerList", answerList);

        model.addAllAttributes(map);
        return "userprofile";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        userService.logout(request, response);
        return "redirect:/login";
    }
}