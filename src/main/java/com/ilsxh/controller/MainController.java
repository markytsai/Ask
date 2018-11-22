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
public class MainController {

    /**
     * index page router
     */
    @RequestMapping(value = {"/", "/login"}, method = RequestMethod.GET)
    public ModelAndView login() {
        return new ModelAndView("login", "", null);
    }

    @RequestMapping(value = {"index"}, method = RequestMethod.GET)
    public String index() {
        return "redirect:/focus";
//        return new ModelAndView("index", "", null);
    }


}
