package com.ilsxh.service;

import com.ilsxh.dao.SearchDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchService {

    @Autowired
    private SearchDao searchDao;

    public List<Question> globalSearchQuestion(String queryKeyWord) {
        return searchDao.globalSearchQuestion(queryKeyWord);
    }

    public List<User> globalSearchUser(String queryKeyWord) {
        return searchDao.globalSearchUser(queryKeyWord);
    }


    public List<Answer> globalSearchAnswer(String queryKeyWord) {
        return searchDao.globalSearchAnswer(queryKeyWord);
    }

}
