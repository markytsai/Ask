package com.ilsxh.dao;

import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 */
public interface QuestionDao {

    /**
     * 查询登陆用户关注的问题列表
     *
     * @param userId
     * @return
     */
    List<Question> selectFollowingQuestionByUserId(@Param("userId") String userId);

    List<Answer> selectAnswersByQuestionId(@Param("questionId") String questionId);

    Question selectQuestionByQuestionId(@Param("questionId") String questionId);

    List<Question> selectRaisedQuestionByUserId(@Param("userId") String userId);

    Integer hasUserFollowQuestion(@Param("userId") String userId, @Param("questionId") String questionId);

    Integer followQuestion(@Param("userId") String userId, @Param("questionId") String questionId);

    Integer unfollowQuestion(@Param("userId") String userId, @Param("questionId") String questionId);

    void submitAnswer(@Param("userId") String userId, @Param("answerContent") String answerContent, @Param("questionId") String questionId);

    void deleteAnswer(@Param("answerId") String answerId);




}
