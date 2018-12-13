package com.ilsxh.service;

import com.ilsxh.dao.AnswerDao;
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

    @Autowired
    private AnswerDao answerDao;


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

    public List<Answer> getAnswersByQuestionId(String questionId, String userId) {

        List<Answer> answerList = questionDao.selectAnswersByQuestionId(questionId);
        for (Answer answer : answerList) {
            User user = userDao.selectUserByUserId(answer.getAnswerUserId());
            Byte upOrDownVote = answerDao.userVote(answer.getAnswerId(), userId);
            if (upOrDownVote != null) {
                user.setVote(upOrDownVote);
            }
            answer.setUser(user);
        }
        return answerList;
    }

    public List<Question> getRaisedQuestionByUserId(String userId) {
        List<Question> questionList = questionDao.selectFollowingQuestionByUserId(userId);

        for (Question question : questionList) {
            User user = new User();
            user.setUserId(question.getUserId());
            user.setUsername(userDao.selectUsernameByUserId(question.getUserId()));
            question.setUser(user);
        }
        return questionList;
    }

    public Question getQuestionByQuestionid(String questionID) {
        return questionDao.selectQuestionByQuestionId(questionID);
    }

    public String hasUserFollowQuestion(String userId, String questionId) {

        Integer ret = questionDao.hasUserFollowQuestion(userId, questionId);
        if (ret != null && ret.equals(1)) {
            return "true";
        } else {
            return "false";
        }

    }

    public Integer followQuestion(String localUserId, String questionId) {
        return questionDao.followQuestion(localUserId, questionId);
    }

    public Integer unfollowQuestion(String localUserId, String questionId) {
        return questionDao.unfollowQuestion(localUserId, questionId);
    }

    public void submitAnswer(String userId, String answerContent, String questionId) {
        questionDao.submitAnswer(userId, answerContent, questionId);
    }

    public void deleteAnswer(String answerId) {
        questionDao.deleteAnswer(answerId);
    }
}
