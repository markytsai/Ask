package com.ilsxh.controller;

import com.ilsxh.enums.StatusEnum;
import com.ilsxh.response.BaseResponse;
import com.ilsxh.service.AnswerService;
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
    public BaseResponse<String> voteAnswer(@PathVariable("answerId") Integer answerId, @RequestParam("userVote") Integer currVoteStatus,
                                           @RequestParam("upOrDownClick") Integer upOrDownClick, HttpServletRequest request) {
        answerService.vote(request, answerId, currVoteStatus, upOrDownClick);

        BaseResponse<String> response = new BaseResponse();

        if (currVoteStatus == NOT_VOTE_FOR_ANSWER && upOrDownClick == 1) {
            response.setCode(StatusEnum.SUCCESS.getCode());
            response.setMessage("你赞同的此回答");
            return response;
        } else if (currVoteStatus == NOT_VOTE_FOR_ANSWER && upOrDownClick == -1) {
            response.setCode(StatusEnum.SUCCESS.getCode());
            response.setMessage("你反对了此回答");
            return response;
        }
        return new BaseResponse<>(StatusEnum.FAIL.getCode(), "", "");
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
    public BaseResponse collectAnswer(@PathVariable("answerId") Integer answerId, @RequestParam("isCollect") Boolean isCollect, HttpServletRequest request) {
        // 默认不成功
        Integer effectRow = 0;
        BaseResponse<String> response = new BaseResponse();
        if (isCollect == Boolean.TRUE) {
            effectRow = answerService.cancelCollectAnswer(answerId, request);
            if (effectRow != null && effectRow == 0) {
                return new BaseResponse(StatusEnum.OPERATION_ERROR.getCode(), "取消收藏失败", "");
            }
            response.setCode(StatusEnum.SUCCESS.getCode());
            response.setMessage("你取消了收藏此回答");
            return response;
        } else {
            effectRow = answerService.collectAnswer(answerId, request);
            if (effectRow != null && effectRow == 0) {
                return new BaseResponse(StatusEnum.OPERATION_ERROR.getCode(), "取消收藏失败", "");
            }
            response.setCode(StatusEnum.SUCCESS.getCode());
            response.setMessage("你收藏了此回答");
            return response;
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
    public BaseResponse getAnswerId(@PathVariable Integer questionId, HttpServletRequest request) {

        Integer answerId = answerService.getAnswerId(questionId, request);
        BaseResponse<String> response;

        if (answerId != null) {
            response = new BaseResponse(StatusEnum.SUCCESS.getCode(), "成功获取已回答ID", answerId);
        } else {
            response = new BaseResponse(StatusEnum.SUCCESS.getCode(), "还没有回答问题", answerId);
        }
        return response;
    }
}
