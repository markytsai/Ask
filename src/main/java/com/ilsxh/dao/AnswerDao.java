package com.ilsxh.dao;

import com.ilsxh.entity.Answer;

import java.util.List;

public interface AnswerDao {

    List<Answer> getAnswersByUserId(String userId);
}
