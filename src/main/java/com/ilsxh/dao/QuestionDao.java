package com.ilsxh.dao;

import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.Topic;
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

    List<Question> selectRecommendedQuestionByUserId();

    List<Question> getRaisedQuestionByUserId(@Param("userId") String userId);

    List<Answer> selectAnswersByQuestionId(@Param("questionId") Integer questionId);

    Question selectQuestionByQuestionId(@Param("questionId") Integer questionId);

    List<Question> selectRaisedQuestionByUserId(@Param("userId") String userId);

    Integer hasUserFollowQuestion(@Param("userId") String userId, @Param("questionId") Integer questionId);

    Integer followQuestion(@Param("userId") String userId, @Param("questionId") Integer questionId, @Param("createTime") Long createTime);

    Integer unfollowQuestion(@Param("userId") String userId, @Param("questionId") Integer questionId);

    void submitAnswer(@Param("answer") Answer answer);

    void updateAnswer(@Param("userId") String userId, @Param("answerId") Integer answerId, @Param("answerContent") String answerContent, @Param("createTime") Long createTime, @Param("questionId") Integer questionId);

    void deleteAnswer(@Param("answerId") String answerId);

    void addQuestion(@Param("question") Question question, @Param("userId") String userId, @Param("createTime") Long createTime);

    void addQuestionTopic(@Param("questionId") Integer questionId, @Param("topicId") Integer topicId);

    List<Topic> getRelatedTopics(@Param("questionId") Integer questionId);

    List<Question> getProbablyRelativeQestions(@Param("partialWord") String partialWord);

    Integer isQuestionAnswered(@Param("userId") String userId, @Param("questionId") Integer questionId);
}
