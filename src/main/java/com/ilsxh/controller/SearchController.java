package com.ilsxh.controller;

import com.ilsxh.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class SearchController {

    private SearchService searchService;

    @Autowired
    public SearchController(SearchService searchService) {
        this.searchService = searchService;
    }

    /**
     * 搜索包含关键词的问题
     *
     * @param keyword
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String globlalSearch(String type, String keyword, @RequestParam("page") Integer pageNo, HttpServletRequest request, Model model) {

        String responsePage = searchService.globalSearch(type, keyword, pageNo, model, request);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return responsePage;
    }
}
