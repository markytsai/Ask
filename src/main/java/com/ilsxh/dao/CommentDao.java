package com.ilsxh.dao;

import com.ilsxh.entity.AnswerComment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentDao {
//    List<QuestionComment> listQuestionCommentByQuestionId(@Param("questionId") Integer questionId);

    List<AnswerComment> listAnswerCommentByAnswerId(@Param("answerId") Integer answerId);

//    void insertQuestionComment(QuestionComment comment);
//
//    void insertQuestionCommentReply(QuestionComment comment);

    void insertAnswerComment(AnswerComment comment);

    void insertAnswerCommentReply(AnswerComment comment);

    int selectAnswerCommentCountByAnswerId(@Param("answerId") Integer answerId);

    Integer delComment(@Param("commentId") Integer commentId, @Param("userId") String userId);
}
