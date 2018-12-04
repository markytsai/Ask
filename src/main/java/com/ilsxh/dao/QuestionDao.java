package com.ilsxh.dao;

import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 */
public interface QuestionDao {

    /**
     * 查询登陆用户关注的问题列表
     * @param userId
     * @return
     */
    List<Question> selectFollowingQuestionByUserId(@Param("userId") String userId);


}
