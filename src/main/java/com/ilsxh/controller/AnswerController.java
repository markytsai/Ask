package com.ilsxh.controller;

import com.ilsxh.service.AnswerService;
import com.ilsxh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping
public class AnswerController {

    @Autowired
    private UserService userService;

    @Autowired
    private AnswerService answerService;

    @RequestMapping("/upvoteAnswer/{answerId}")
    public void upvoteAnswer(@PathVariable("answerId") String answerId, @RequestParam("userVote") Integer userVote, HttpServletRequest request) {
        String localUserId = userService.getUserIdFromRedis(request);
        answerService.upvoteAnswer(localUserId, answerId, userVote);
    }

    @RequestMapping("/downvoteAnswer/{answerId}")
    public void downvoteAnswer(@PathVariable("answerId") String answerId, @RequestParam("userVote") Integer userVote, HttpServletRequest request) {
        String localUserId = userService.getUserIdFromRedis(request);
        answerService.downvoteAnswer(localUserId, answerId, userVote);
    }

    @RequestMapping("/collectAnswer/{answerId}")
    public void collectAnswer(@PathVariable("answerId") Integer answerId, @RequestParam("isCollect") Boolean isCollect, HttpServletRequest request) {
        String localUserId = userService.getUserIdFromRedis(request);
        if (isCollect == Boolean.TRUE) {
            answerService.cancelCollectAnswer(localUserId, answerId);
        } else {
            answerService.collectAnswer(localUserId, answerId);
        }
    }


}
