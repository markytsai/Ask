package com.ilsxh.dao;

import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.Topic;
import com.ilsxh.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TopicDao {

    Topic getTopicByTopicId(@Param("topicId") Integer topicId);

    List<Question> getQuestionWithThisTopic(@Param("topicId") Integer topicId);

    List<Answer> getAnswersByTopicId(@Param("topicId") Integer topicId);

    List<User> getollowingUserByUserId(@Param("topicId") Integer topicId);

    Integer getTopicIdByTopicName(String topicName);

    List<Topic> getProbablyRelativeTopics(@Param("partialWord") String partialWord);

    Integer getCurrStat(@Param("localUserId") String localUserId, @Param("topicId") Integer topicId);

    Integer insertfollowTopic(@Param("localUserId") String localUserId, @Param("topicId") Integer topicId, @Param("targetStatus")Integer targetStatus);


    Integer updateFollowTopic(@Param("localUserId") String localUserId, @Param("topicId") Integer topicId, @Param("targetStatus")Integer targetStatus);

    List<Topic> getAllTopicsFromColdStart();

    List<Topic> getAllTopics();

    List<Topic> getChilrenTopicByTopicId(@Param("userId")String userId, @Param("rootTopicId") Integer rootTopicId);

    List<Topic> getThirdLevelChilrenTopic(@Param("userId")String userId, @Param("topicId")Integer topicId);

    List<Topic> getAllThirdTopics(@Param("topicId")Integer topicId);

    List<Integer> getFollowedThirdTopics(@Param("userId")String userId, @Param("topicId") Integer topicId);

    void updateUserFollowTopics(@Param("userId") String userId, @Param("topicIds") List<Integer> topicIds);

    Integer initUserFollowTopics(@Param("userId") String userId, @Param("topicIds") List<Topic> topicIds);

    void zeroAllTopicByUserId(String userId);

    List<Topic> getFollowingTopicByUserId(String userId);
}
