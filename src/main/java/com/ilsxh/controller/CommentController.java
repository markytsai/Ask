package com.ilsxh.controller;

import com.ilsxh.entity.AnswerComment;
import com.ilsxh.service.CommentService;
import com.ilsxh.service.UserService;
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

    @Autowired
    private UserService userService;

    @Autowired
    private CommentService commentService;

//    @RequestMapping("/commentQuestion")
//    @ResponseBody
//    public Response commentQuestion(Integer questionId, String commentContent, HttpServletRequest request) {
//        Integer userId = userService.getUserIdFromRedis(request);
//        QuestionComment comment = commentService.commentQuestion(questionId, commentContent, userId);
//        return new Response(0, "", comment);
//    }

//    @RequestMapping("/replyQuestionComment")
//    @ResponseBody
//    public Response replyQuestionComment(QuestionComment questionComment, HttpServletRequest request) {
//        System.out.println(questionComment);
//        Integer userId = userService.getUserIdFromRedis(request);
//        QuestionComment comment = commentService.replyQuestionComment(questionComment, userId);
//        return new Response(0, "", comment);
//    }

//    @RequestMapping("/likeQuestionComment")
//    @ResponseBody
//    public Response likeQuestionComment(Integer questionCommentId, HttpServletRequest request) {
//        String userId = userService.getUserIdFromRedis(request);
//        commentService.likeQuestionComment(userId, questionCommentId);
//        return new Response(0, "");
//    }

    @RequestMapping(value = "/commentAnswer", method = RequestMethod.POST)
    @ResponseBody
    public Response commentAnswer(Integer answerId, String commentContent, HttpServletRequest request) {
        String userId = userService.getUserIdFromRedis(request);
        AnswerComment comment = commentService.commentAnswer(answerId, commentContent, userId);
        return new Response(1, "", comment);
    }

    @RequestMapping(value = "/replyComment", method = RequestMethod.POST)
    @ResponseBody
    public Response replyComment(String commentId, String commentContent, HttpServletRequest request) {
        String userId = userService.getUserIdFromRedis(request);
        AnswerComment comment = commentService.replyComment(commentId, commentContent, userId);
        return new Response(1, "", comment);
    }

    @RequestMapping("/delComment/{commentId}")
    @ResponseBody
    public Response delComment(@PathVariable Integer commentId, HttpServletRequest request) {
        String userId = userService.getUserIdFromRedis(request);
        Integer ret = commentService.delComment(commentId, userId);
        return new Response(ret, "", "");
    }

    @RequestMapping("/replyAnswerComment")
    @ResponseBody
    public Response replyAnswerComment(AnswerComment answerComment, HttpServletRequest request) {
        System.out.println(answerComment);
        String userId = userService.getUserIdFromRedis(request);
        AnswerComment comment = commentService.replyAnswerComment(answerComment, userId);
        return new Response(0, "", comment);
    }

//    @RequestMapping("/likeAnswerComment")
//    @ResponseBody
//    public Response likeAnswerComment(Integer answerCommentId, HttpServletRequest request) {
//        String userId = userService.getUserIdFromRedis(request);
//        commentService.likeAnswerComment(userId, answerCommentId);
//        return new Response(0, "");
//    }
}
