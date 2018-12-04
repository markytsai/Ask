package com.ilsxh.dao;

import com.ilsxh.entity.User;
import org.apache.ibatis.annotations.Param;

/**
 *
 */
public interface UserDao {

    /**
     *
     * @param userId
     * @return
     */
    User selectUserByUserId(@Param("userId") String userId);

    /**
     *
     * @param email
     * @param passworde
     * @return
     */
    String selectUserIdByEmailAndPassword(@Param("email") String email, @Param("password") String passworde);

    User selectUserByEmail(@Param("email") String email);

    String selectUsernameByUserId(@Param("userId") String userId);

    Integer regiterNewUser(@Param("userId")String userId, @Param("email") String email, @Param("username") String username, @Param("password") String password);
}

