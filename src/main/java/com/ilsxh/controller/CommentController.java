package com.ilsxh.controller;

import com.ilsxh.entity.AnswerComment;
import com.ilsxh.service.CommentService;
import com.ilsxh.service.UserHelperService;
import com.ilsxh.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CommentController {

    private UserHelperService userHelperService;
    private CommentService commentService;

    @Autowired
    public CommentController(UserHelperService userHelperService, CommentService commentService) {
        this.userHelperService = userHelperService;
        this.commentService = commentService;
    }

    /**
     * 对回答进行评论
     * @param answerId
     * @param commentContent
     * @param request
     * @return
     */
    @RequestMapping(value = "/commentAnswer", method = RequestMethod.POST)
    @ResponseBody
    public Response commentAnswer(Integer answerId, String commentContent, HttpServletRequest request) {
        String userId = userHelperService.getUserIdFromRedis(request);
        AnswerComment comment = commentService.commentAnswer(answerId, commentContent, userId);
        return new Response(1, "", comment);
    }

    /**
     * 对评论进行回复，该功能暂时还没有完善
     * @param commentId
     * @param commentContent
     * @param request
     * @return
     */
    @RequestMapping(value = "/replyComment", method = RequestMethod.POST)
    @ResponseBody
    public Response replyComment(String commentId, String commentContent, HttpServletRequest request) {
        String userId = userHelperService.getUserIdFromRedis(request);
        AnswerComment comment = commentService.replyComment(commentId, commentContent, userId);
        return new Response(1, "", comment);
    }

    /**
     * 删除评论
     * @param commentId
     * @param request
     * @return
     */
    @RequestMapping("/delComment/{commentId}")
    @ResponseBody
    public Response delComment(@PathVariable Integer commentId, HttpServletRequest request) {
        String userId = userHelperService.getUserIdFromRedis(request);
        Integer ret = commentService.delComment(commentId, userId);
        return new Response(ret, "", "");
    }
}
