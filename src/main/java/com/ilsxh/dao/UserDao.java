package com.ilsxh.dao;

import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import com.ilsxh.enums.StatusEnum;
import com.ilsxh.vo.FirstLoginVo;
import com.ilsxh.vo.UserTopicVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.sql.Timestamp;
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

    Question selectQuestionByQuestionId(@Param("questionId") Integer questionId);

    /**
     * returned user with follow_status by the login user
     *
     * @param userId
     * @return
     */
    Integer selectUserByUserIdWithFollowingStatus(@Param("userId") String userId, @Param("localUserId") String localUserId);

    /**
     * @param email
     * @param passworde
     * @return
     */
    FirstLoginVo selectUserIdByEmailAndPassword(@Param("email") String email, @Param("password") String passworde);

    User selectUserByEmail(@Param("email") String email);

    String selectUsernameByUserId(@Param("userId") String userId);

    Integer regiterNewUser(@Param("userId") String userId, @Param("email") String email, @Param("username") String username, @Param("password") String password);

    List<Answer> getAnswersByUserId(@Param("userId") String userId, @Param("offSet") Integer offSet, @Param("pageSize") Integer pageSize);

    /**
     * 获取page的总记录数
     * @param userId
     * @return
     */
    Integer getTotalAnswerByUserId(@Param("userId") String userId);


    Integer getUserFollowStatus(@Param("userId") String userId, @Param("userIdToBeFollowed") String userIdToBeFollowed);

    Integer insertUserFollowStatus(@Param("userId") String userId, @Param("userIdToBeFollowed") String userIdToBeFollowed, @Param("followStatus") Integer followStatus, @Param("createTime") Timestamp createTime);

    Integer updateUserFollowStatus(@Param("userId") String userId, @Param("userIdToBeFollowed") String userIdToBeFollowed, @Param("followStatus") Integer followStatus, @Param("createTime") Timestamp createTime);

    List<User> getollowingUserByUserId(@Param("userId") String userId, @Param("offset") Integer offset, @Param("limit") Integer limit);

    Integer updateFirstLoginStatus(@Param("userId") String userId, @Param("firstLogin") String continueLogin);

    Integer updateUsernameByUserId(@Param("userId") String userId, @Param("newUsername") String newUsername);

    Integer updateUserGenderByUserId(@Param("userId") String userId, @Param("newGender") Integer newGender);

    Integer updateUserEmailByUserId(@Param("userId") String userId, @Param("newEmail") String newEmail);

    Integer updateUserIndustryByUserId(@Param("userId") String userId, @Param("newIndustry") String newIndustry);

    Integer updateUserPositionByUserId(@Param("userId") String userId, @Param("newPosition") String newPosition);

    Integer updateUserSimpleDescByUserId(@Param("userId") String userId, @Param("newSimpleDesc") String newSimpleDesc);

    Integer updateUserFullDescByUserId(@Param("userId") String userId, @Param("newFullDesc") String newFullDesc);


    Integer getTotalFollowingUserNum(@Param("userId") String  userId);
}

