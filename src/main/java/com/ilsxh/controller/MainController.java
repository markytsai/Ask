package com.ilsxh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * global URL router
 *
 * @author Caizhenya
 * @date
 */
@Controller
@RequestMapping
public class MainController {

    /**
     * index page router
     */
    @RequestMapping(value = {"/", "/login"}, method = RequestMethod.GET)
    public ModelAndView login() {
        return new ModelAndView("login", "", null);
    }

    /**
     * 进入首页，问题关注模块
     *
     * @return
     */
    @RequestMapping(value = {"index"}, method = RequestMethod.GET)
    public String index() {
        return "redirect:/following";
    }

    /**
     * 返回注册页面
     *
     * @return
     */
    @RequestMapping(value = {"register"}, method = RequestMethod.GET)
    public ModelAndView register() {
        return new ModelAndView("register", "", null);
    }

    /**
     * 未登录用户首页地址
     * @return
     */
    @RequestMapping(value = "/tourist", method = RequestMethod.GET)
    public String touristLogin() {
        return "redirect:/moreHotQuestion";
    }

    @RequestMapping(value = "/notification", method = RequestMethod.GET)
    public String notification() {
        return "redirect:/notification/user";
    }
}
