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
//        return new ModelAndView("index", "", null);
    }

    @RequestMapping(value = {"register"}, method = RequestMethod.GET)
    public ModelAndView register() {
        return new ModelAndView("register", "", null);
    }
}
