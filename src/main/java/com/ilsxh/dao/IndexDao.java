package com.ilsxh.dao;

import com.ilsxh.entity.Activity;
import com.ilsxh.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IndexDao {

    void updateProfile(User user);

    Integer isQuestionAnswered(@Param("userId") String userId, @Param("questionId") Integer questionId);

    User selectProfileInfoByUserId(@Param("userId") String userId);

    void updatePassword(@Param("userId") String userId, @Param("newpassword") String newpassword);

    /**
     * 修改密码之前查询旧密码
     * @param userId
     * @param password
     * @return
     */
    Integer selectUserCountByUserIdAndPassword(@Param("userId") String userId, @Param("password") String password);

    /**
     * 更新用户头像
     * @param userId
     * @param avatarUrl
     */
    void updateAvatarUrl(@Param("userId") String userId, @Param("avatarUrl") String avatarUrl);

    List<Activity> getFollowedQuestion(@Param("userId") String userId);

    List<Activity> getVotedAnswer(@Param("userId") String userId);

    List<Activity> getRaisedQuestion(@Param("userId") String userId);

    List<Activity> getAnswer(@Param("userId") String userId);

    List<Activity> getCollectionAnswer(@Param("userId") String userId);

    List<Activity> getFollowingUser(@Param("userId") String userId);


}


