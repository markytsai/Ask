package com.ilsxh.dao;

import com.ilsxh.vo.UserCollectAnswerVo;
import com.ilsxh.vo.UserQuestionVo;
import com.ilsxh.vo.UserTopicVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import java.util.List;
import java.util.Set;

public interface TrainDao {
    /**
     * 训练：去除所有问题和话题的关系
     *
     * @return
     */
    List<UserTopicVo> getAllUserTopic();

    List<UserQuestionVo> getUserCollectAnswer(@Param("userId") String userId);

    List<UserQuestionVo> getUserVoteUpAnswer(@Param("userId") String userId);

    List<UserQuestionVo> getUserFollowQuestion(@Param("userId") String userId);

    Integer insertUserRecommendQuestion(@Param("userId") String userId, @Param("questionIds") String questionIds);

    Integer updateUserRecommendQuestion(@Param("userId") String userId, @Param("questionIds") String questionIds);

    String getRecommendQuestionByUserId(@Param("userId") String userId);

    Integer getUserInterestedQuestionIds(@Param("userId") String userId);

}
