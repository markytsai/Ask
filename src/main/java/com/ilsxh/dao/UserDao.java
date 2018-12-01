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
    User selectUserByUserId(@Param("userId") Integer userId);

    /**
     *
     * @param email
     * @param passworde
     * @return
     */
    Integer selectUserIdByEmailAndPassword(@Param("email") String email, @Param("password") String passworde);

    User selectUserByEmail(@Param("email") String email);

    String selectUsernameByUserId(@Param("userId") Integer userId);


    Integer regiterNewUser(@Param("email") String email, @Param("username") String username, @Param("password") String password);
}

