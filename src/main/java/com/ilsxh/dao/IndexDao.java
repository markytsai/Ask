package com.ilsxh.dao;

import com.ilsxh.entity.User;
import org.apache.ibatis.annotations.Param;

public interface IndexDao {

    void updateProfile(User user);

    User selectProfileInfoByUserId(@Param("userId") String userId);

    void updatePassword(@Param("userId") String userId, @Param("newpassword") String newpassword);

    /**
     * 修改密码之前查询旧密码
     * @param userId
     * @param password
     * @return
     */
    int selectUserCountByUserIdAndPassword(@Param("userId") String userId, @Param("password") String password);

    /**
     * 更新用户头像
     * @param userId
     * @param avatarUrl
     */
    void updateAvatarUrl(@Param("userId") String userId, @Param("avatarUrl") String avatarUrl);
}

