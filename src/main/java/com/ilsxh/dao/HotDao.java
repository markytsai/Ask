package com.ilsxh.dao;

import com.ilsxh.entity.Question;
import com.ilsxh.entity.Topic;
import com.ilsxh.entity.User;

import java.util.List;

public interface HotDao {

    public List<Question> getHotQuestions();

    public List<User> getHotUsers();

    public List<Topic> getHotTopics();

    public List<Question> getNewestRaisedQuestions();
}
