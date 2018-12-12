package com.ilsxh.dao;

import com.ilsxh.entity.Answer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnswerDao {

    void increAnswerUpVote(@Param("answerId") String answerId);

    void increAnswerDownVote(@Param("answerId") String answerId);
}
