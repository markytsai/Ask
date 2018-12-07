package com.ilsxh.service;

import com.ilsxh.dao.QuestionDao;
import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

/**
 * @ClassName: QuestionService
 * @Description TODO
 * @Auther: Caizhenya
 * @Date: 2018/11/22 14:35
 * @Version: 1.0.0
 */
@Service
public class QuestionService {

    @Autowired
    private QuestionDao questionDao;

    @Autowired
    private UserDao userDao;


    public List<Question> getFollowingQuestionByUserId(String userId) {
        List<Question> questionList = questionDao.selectFollowingQuestionByUserId(userId);

        for (Question question : questionList) {
            User user = new User();
            user.setUserId(question.getUserId());
            user.setUsername(userDao.selectUsernameByUserId(question.getUserId()));
            question.setUser(user);
        }
        return questionList;

    }

    public List<Answer> getAnswersByQuestionId(String questionId) {

        List<Answer> answerList = questionDao.selectAnswersByQuestionId(questionId);
        for (Answer answer : answerList) {
            answer.setUser(userDao.selectUserByUserId(answer.getUserId()));
        }

        return answerList;
    }

    public Question getQuestionByQuestionid(String questionID) {
        return questionDao.selectQuestionByQuestionId(questionID);
    }

}
