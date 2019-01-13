package com.ilsxh.service;

import com.ilsxh.dao.CommentDao;
import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.AnswerComment;
import com.ilsxh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;

import java.util.Date;

@Service
public class CommentService {

    @Autowired
    private CommentDao commentDao;

    @Autowired
    private UserService userService;

//    public QuestionComment replyQuestionComment(QuestionComment comment, Integer userId) {
//        comment.setLikedCount(0);
//        comment.setCreateTime(new Date().getTime());
//        comment.setUserId(userId);
//
//        commentMapper.insertQuestionCommentReply(comment);
//        User user = userMapper.selectUserInfoByUserId(userId);
//        comment.setUser(user);
//
//        return comment;
//    }

    // 评论回答
    public AnswerComment commentAnswer(Integer answerId, String commentContent, String userId) {
        AnswerComment comment = new AnswerComment();
        comment.setLikedCount(0);
        comment.setCreateTime(new Date().getTime());
        comment.setAnswerCommentContent(commentContent);
        comment.setAnswerId(answerId);
        comment.setUserId(userId);

        commentDao.insertAnswerComment(comment);
        User user = userService.getUserByUserId(userId);
        comment.setUser(user);

        return comment;
    }

    public AnswerComment replyAnswerComment(AnswerComment comment, String userId) {
        comment.setLikedCount(0);
        comment.setCreateTime(new Date().getTime());
        comment.setUserId(userId);

        commentDao.insertAnswerCommentReply(comment);
        User user = userService.getUserByUserId(userId);
        comment.setUser(user);

        return comment;
    }

    public Integer delComment(Integer commentId, String userId) {
        commentDao.delComment(commentId, userId);
        return Integer.valueOf(1);
    }
//    public void likeQuestionComment(Integer userId, Integer questionCommentId) {
//        Jedis jedis = jedisPool.getResource();
//        jedis.zadd(userId + RedisKey.LIKE_QUESTION_COMMENT, new Date().getTime(), String.valueOf(questionCommentId));
//        jedis.zadd(questionCommentId + RedisKey.LIKED_QUESTION_COMMENT, new Date().getTime(), String.valueOf(userId));
//        jedisPool.returnResource(jedis);
//    }

//    public void likeAnswerComment(Integer userId, Integer answerCommentId) {
//        Jedis jedis = jedisPool.getResource();
//        jedis.zadd(userId + RedisKey.LIKE_ANSWER_COMMENT, new Date().getTime(), String.valueOf(answerCommentId));
//        jedis.zadd(answerCommentId + RedisKey.LIKED_ANSWER_COMMENT, new Date().getTime(), String.valueOf(userId));
//        jedisPool.returnResource(jedis);
//    }
}
