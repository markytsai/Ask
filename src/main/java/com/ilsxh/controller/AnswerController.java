package com.ilsxh.controller;

import com.ilsxh.redis.AnswerKey;
import com.ilsxh.service.AnswerService;
import com.ilsxh.service.RedisService;
import com.ilsxh.service.UserService;
import com.ilsxh.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping
public class AnswerController {

    @Autowired
    private UserService userService;

    @Autowired
    private AnswerService answerService;

    @Autowired
    private RedisService redisService;

    @RequestMapping("/voteAnswer/{answerId}")
    public void voteAnswer(@PathVariable("answerId") Integer answerId, @RequestParam("userVote") Integer currVoteStatus,
                           @RequestParam("upOrDownClick") Integer upOrDownClick, HttpServletRequest request) {
        String localUserId = userService.getUserIdFromRedis(request);
        answerService.vote(localUserId, answerId, currVoteStatus, upOrDownClick, new Date().getTime());
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

    @RequestMapping("/getAnswerId/{questionId}")
    @ResponseBody
    public Response getAnswerId(@PathVariable Integer questionId, HttpServletRequest request) {

        String localUserId = userService.getUserIdFromRedis(request);

        Integer answerId = redisService.get(AnswerKey.answerKey, "-" + localUserId + "-" + questionId, Integer.class);
        Response response = null;
        if (answerId != null) {
            response = new Response(1, "成功获取已回答ID", answerId);
        } else {
            response = new Response(1, "还没有回答问题", 0);
        }
        return response;

    }


}
