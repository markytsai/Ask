package com.ilsxh.dao;

import com.ilsxh.entity.Answer;
import com.ilsxh.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 *
 */
public interface UserDao {

    /**
     * @param userId
     * @return
     */
    User selectUserByUserId(@Param("userId") String userId);

    /**
     * returned user with follow_status by the login user
     * @param userId
     * @return
     */
    Integer selectUserByUserIdWithFollowingStatus(@Param("userId") String userId, @Param("localUserId") String localUserId);

    /**
     * @param email
     * @param passworde
     * @return
     */
    String selectUserIdByEmailAndPassword(@Param("email") String email, @Param("password") String passworde);

    User selectUserByEmail(@Param("email") String email);

    String selectUsernameByUserId(@Param("userId") String userId);

    Integer regiterNewUser(@Param("userId") String userId, @Param("email") String email, @Param("username") String username, @Param("password") String password);

    List<Answer> getAnswersByUserId(@Param("userId") String userId);



    Integer getUserFollowStatus(@Param("userId") String userId, @Param("userIdToBeFollowed") String userIdToBeFollowed);

    Integer insertUserFollowStatus(@Param("userId") String userId, @Param("userIdToBeFollowed") String userIdToBeFollowed, @Param("followStatus") Integer followStatus);

    Integer updateUserFollowStatus(@Param("userId") String userId, @Param("userIdToBeFollowed") String userIdToBeFollowed, @Param("followStatus") Integer followStatus);

    List<User> getollowingUserByUserId(@Param("userId") String userId);

}

