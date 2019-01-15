package com.ilsxh.service;

import com.ilsxh.dao.HotDao;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.Topic;
import com.ilsxh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HotService {

    private HotDao hotDao;

    @Autowired
    public HotService(HotDao hotDao) {
        this.hotDao = hotDao;
    }

    public List<Question> getHotQuestion() {

        List<Question> hotQuestionList = hotDao.getHotQuestions();
        return hotQuestionList;
    }

    public List<User> getHotUsers() {
        List<User> hotUserList = hotDao.getHotUsers();
        return hotUserList;
    }

    public List<Topic> getHotTopic() {
        List<Topic> hotTopicList = hotDao.getHotTopics();
        return hotTopicList;
    }

    public List<Question> getNewestRaisedQuestion() {
        List<Question> hotQuestionList = hotDao.getNewestRaisedQuestions();
        return hotQuestionList;
    }
}
