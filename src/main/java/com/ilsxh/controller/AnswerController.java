package com.ilsxh.controller;

import com.ilsxh.service.AnswerService;
import com.ilsxh.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import static com.ilsxh.service.AnswerService.NOT_VOTE_FOR_ANSWER;

@Controller
@RequestMapping
public class AnswerController {

    private AnswerService answerService;

    @Autowired
    public AnswerController(AnswerService answerService) {
        this.answerService = answerService;
    }

    /**
     * 用户给回答投票
     *
     * @param answerId
     * @param currVoteStatus 当下投票状态
     * @param upOrDownClick  -1：反对；1：赞同
     * @param request
     * @return
     */
    @RequestMapping("/voteAnswer/{answerId}")
    @ResponseBody
    public Response voteAnswer(@PathVariable("answerId") Integer answerId, @RequestParam("userVote") Integer currVoteStatus,
                               @RequestParam("upOrDownClick") Integer upOrDownClick, HttpServletRequest request) {
        answerService.vote(request, answerId, currVoteStatus, upOrDownClick);

        if (currVoteStatus == NOT_VOTE_FOR_ANSWER && upOrDownClick == 1) {
            return new Response(1, "你赞同了此回答", "");
        } else if (currVoteStatus == NOT_VOTE_FOR_ANSWER && upOrDownClick == -1) {
            return new Response(1, "你反对了此回答", "");
        }
        return new Response(1, "", "");
    }

    /**
     * 用户收藏回答
     *
     * @param answerId
     * @param isCollect
     * @param request
     * @return
     */
    @RequestMapping("/collectAnswer/{answerId}")
    @ResponseBody
    public Response collectAnswer(@PathVariable("answerId") Integer answerId, @RequestParam("isCollect") Boolean isCollect, HttpServletRequest request) {
        if (isCollect == Boolean.TRUE) {
            answerService.cancelCollectAnswer(answerId, request);
            return new Response(0, "你取消了收藏此回答", "");
        } else {
            answerService.collectAnswer(answerId, request);
            return new Response(1, "你收藏了此回答", "");
        }
    }

    /**
     * 获取问题详情页面，登录用户的回答，属于一个工具方法
     *
     * @param questionId
     * @param request
     * @return
     */
    @RequestMapping("/getAnswerId/{questionId}")
    @ResponseBody
    public Response getAnswerId(@PathVariable Integer questionId, HttpServletRequest request) {


        Integer answerId = answerService.getAnswerId(questionId, request);

        Response response = null;
        if (answerId != null) {
            response = new Response(1, "成功获取已回答ID", answerId);
        } else {
            response = new Response(1, "还没有回答问题", 0);
        }
        return response;
    }
}
