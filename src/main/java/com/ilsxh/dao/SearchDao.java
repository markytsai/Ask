package com.ilsxh.dao;

import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SearchDao {

    List<Question> globalSearchQuestion(@Param("queryKeyWord") String queryKeyWord);

    List<User> globalSearchUser(@Param("queryKeyWord") String queryKeyWord);

    List<Answer> globalSearchAnswer(@Param("queryKeyWord") String queryKeyWord);
}
