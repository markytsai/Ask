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

    String selectUsernameByUserId(@Param("userId") Integer userId);
}

