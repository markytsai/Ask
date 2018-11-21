package com.ilsxh.controller;

import com.ilsxh.util.Response;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping
public class UserController {

    private static final Integer LOGIN_SUCCESS = 1;
    private static final Integer LOGIN_FAILURE = 0;

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test() {
        return "test";
    }


    @RequestMapping(value = "/toLogin")
    @ResponseBody
    public Response login(@RequestParam("email") String email, @RequestParam("password") String password) {

        Response response = new Response();
        if ("admin@qq.com".equals(email) && "admin".equals(password)) {
            response.setState(LOGIN_SUCCESS);
            response.setMessage("登陆成功");
        } else {
            response.setState(LOGIN_FAILURE);
            response.setMessage("用户名或密码不对");
        }

        return response;
    }


}