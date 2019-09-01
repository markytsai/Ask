package com.ilsxh.dao;

import com.ilsxh.entity.Question;
import com.ilsxh.entity.Topic;
import com.ilsxh.entity.User;

import java.util.List;

public interface HotDao {

    List<Question> getHotQuestions();

    List<User> getHotUsers();

    List<Topic> getHotTopics();

    List<Question> getNewestRaisedQuestions();

    List<Question> getHotQuestionInDay();

    List<Question> getHotQuestionInWeek();

    List<Question> getHotQuestionInMonth();
}
