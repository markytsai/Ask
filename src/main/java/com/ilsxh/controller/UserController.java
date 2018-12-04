package com.ilsxh.controller;

import com.ilsxh.service.UserService;
import com.ilsxh.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        userService.logout(request, response);
        return "redirect:/login";
    }
}