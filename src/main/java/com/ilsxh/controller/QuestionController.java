package com.ilsxh.controller;

import com.ilsxh.entity.Question;
import com.ilsxh.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @RequestMapping("/following")
    public String getFollowingQuestionsByUserId(Model model) {

        List<Question> questionList = questionService.getFollowingQuestionByUserId(1);
        model.addAttribute("questionList", questionList);

        return "index";
    }
}



