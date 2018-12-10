package com.ilsxh.service;

import com.ilsxh.dao.AnswerDao;
import com.ilsxh.dao.QuestionDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnswerService {

    @Autowired
    private AnswerDao answerDao;

    @Autowired
    private QuestionDao questionDao;

    @Autowired
    private UserService userService;

    public List<Answer> getAnswersByUserId(String userId) {

        List<Answer> answerList = answerDao.getAnswersByUserId(userId);

        for (Answer answer : answerList) {
            Question question = questionDao.selectQuestionByQuestionId(answer.getQuestionId());
            User user = userService.getUserByUserId(answer.getAnswerUserId());
            answer.setQuestion(question);
            answer.setUser(user);
        }
        return answerList;
    }
}
