package com.ilsxh.service;

import com.ilsxh.annotation.OperAnnotation;
import com.ilsxh.dao.CommentDao;
import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.AnswerComment;
import com.ilsxh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;

import java.sql.Timestamp;
import java.util.Date;

@Service
public class CommentService {

    private CommentDao commentDao;
    private UserService userService;

    @Autowired
    public CommentService(CommentDao commentDao, UserService userService) {
        this.commentDao = commentDao;
        this.userService = userService;
    }

    /**
     * 对回答进行评论
     * @param answerId
     * @param commentContent
     * @param userId
     * @return
     */
    @OperAnnotation(descpition = "对回答进行评论")
    public AnswerComment commentAnswer(Integer answerId, String commentContent, String userId) {
        AnswerComment comment = new AnswerComment();
        comment.setLikedCount(0);
        comment.setCreateTime(new Timestamp(System.currentTimeMillis()));
        comment.setAnswerCommentContent(commentContent);
        comment.setAnswerId(answerId);
        comment.setUserId(userId);


        comment.setAtUserId("0");
        comment.setAtUserName("0");
        commentDao.insertAnswerComment(comment);

        comment = commentDao.selectCommentByCommentId(comment.getAnswerCommentId());

        User user = userService.getUserByUserId(userId);
        comment.setUser(user);

        return comment;
    }

    /**
     * 对评论进行回复，暂时！！！不可用！！！
     * @param commentId
     * @param commentContent
     * @param userId
     * @return
     */
    public AnswerComment replyComment(String commentId, String commentContent, String userId) {
        Integer answerId = Integer.valueOf(commentId.split("-")[0]);
        Integer answerCommentId = Integer.valueOf(commentId.split("-")[1]);
//        Integer atAnswerCommentId = Integer.valueOf(commentId.split("-")[2]);
        String atUserId = commentId.split("-")[3];
        String atUserName = commentId.split("-")[4];

        AnswerComment comment = new AnswerComment();
        comment.setLikedCount(0);
        comment.setCreateTime(new Timestamp(System.currentTimeMillis()));
        comment.setAnswerCommentContent(commentContent);
        comment.setAnswerId(answerId);
        comment.setUserId(userId);
        comment.setAnswerCommentId(answerCommentId);

        return comment;

    }

    /**
     * 删除对回答的评论
     * @param commentId
     * @param userId
     * @return
     */
    @OperAnnotation(descpition = "删除对回答的评论")
    public Integer delComment(Integer commentId, String userId) {
        commentDao.delComment(commentId, userId);
        return Integer.valueOf(1);
    }
}
