package com.ilsxh.dao;

import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.Topic;
import com.ilsxh.entity.User;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
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
    List<Question> selectFollowingQuestionByUserId(@Param("userId") String userId, @Param("pageNo") Integer pageNo, @Param("limit") Integer limit);

    List<Question> selectRecommendedQuestionByUserId();

    List<Question> getRaisedQuestionByUserId(@Param("userId") String userId, @Param("offset") Integer offset, @Param("limit") Integer limit);

    /**
     * 获取提出问题的数量
     *
     * @param userId
     * @return
     */
    Integer getTotalQuestions(@Param("userId") String userId);

    List<Answer> selectAnswersByQuestionId(@Param("questionId") Integer questionId);

    Question selectQuestionByQuestionId(@Param("questionId") Integer questionId);

    List<Question> selectRaisedQuestionByUserId(@Param("userId") String userId);

    Integer hasUserFollowQuestion(@Param("userId") String userId, @Param("questionId") Integer questionId);

    Integer followQuestion(@Param("userId") String userId, @Param("questionId") Integer questionId, @Param("createTime") Timestamp createTime);

    Integer unfollowQuestion(@Param("userId") String userId, @Param("questionId") Integer questionId);

    Integer submitAnswer(@Param("answer") Answer answer);

    Integer updateAnswer(@Param("userId") String userId, @Param("answerId") Integer answerId, @Param("answerContent") String answerContent, @Param("createTime") Timestamp createTime, @Param("questionId") Integer questionId);

    Integer deleteAnswer(@Param("answerId") String answerId);

    Integer addQuestion(@Param("question") Question question, @Param("userId") String userId, @Param("topicJson") String topicString, @Param("createTime") Timestamp createTime);

    void addQuestionTopic(@Param("questionId") Integer questionId, @Param("topicId") Integer topicId);

    List<Topic> getRelatedTopics(@Param("questionId") Integer questionId);

    List<Question> getProbablyRelativeQestions(@Param("partialWord") String partialWord);

    Integer isQuestionAnswered(@Param("userId") String userId, @Param("questionId") Integer questionId);

    List<Question> getQuestionListById(List<Integer> list);

    Integer getTotalQuestionNum(@Param("userId") String userId);

    Integer increQuestionFollowedCount(@Param("questionId") Integer questionId, @Param("increCount") Integer increCount);

    Integer getQuestionIdByAnswerId(@Param("userId") String userId, @Param("answerId") String answerId);
}
