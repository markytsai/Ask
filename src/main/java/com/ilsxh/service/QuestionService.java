package com.ilsxh.service;

import com.ilsxh.dao.AnswerDao;
import com.ilsxh.dao.QuestionDao;
import com.ilsxh.dao.TopicDao;
import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.Topic;
import com.ilsxh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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

    @Autowired
    private TopicDao topicDao;


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

    public List<Question> getRecommendedQuestionByUserId() {
        List<Question> questionList = questionDao.selectRecommendedQuestionByUserId();

        for (Question question : questionList) {
            User user = new User();
            user.setUserId(question.getUserId());
            user.setUsername(userDao.selectUsernameByUserId(question.getUserId()));
            question.setUser(user);
        }
        return questionList;
    }


    public List<Answer> getAnswersByQuestionId(Integer questionId, String userId) {

        List<Answer> answerList = questionDao.selectAnswersByQuestionId(questionId);
        for (Answer answer : answerList) {
            User user = userDao.selectUserByUserId(answer.getAnswerUserId());
            Integer upOrDownVote = answerDao.getUserVoteStatus(answer.getAnswerId(), userId);
            Integer isCollectAnswer = answerDao.isCollectAnswer(answer.getAnswerId(), userId);
            // 获取答主关注状态，是否被关注
            Integer userFollowStatus = userDao.getUserFollowStatus(userId, answer.getAnswerUserId());
            if (userFollowStatus == null) {
                user.setFollowStatus(0);
            } else {
                user.setFollowStatus(userFollowStatus);
            }
            if (upOrDownVote != null) {
                user.setVote(upOrDownVote);
            } else {
                user.setVote(0);
            }
            if (isCollectAnswer != null && isCollectAnswer == 1) {
                answer.setCollectAnswer(Boolean.TRUE);
            } else {
                answer.setCollectAnswer(Boolean.FALSE);
            }
            answer.setUser(user);
        }
        return answerList;
    }

    public List<Question> getRaisedQuestionByUserId(String userId) {
        List<Question> questionList = questionDao.getRaisedQuestionByUserId(userId);

        for (Question question : questionList) {
            User user = new User();
            user.setUserId(question.getUserId());
            user.setUsername(userDao.selectUsernameByUserId(question.getUserId()));
            question.setUser(user);
        }
        return questionList;
    }

    public Question getQuestionByQuestionid(Integer questionID) {
        return questionDao.selectQuestionByQuestionId(questionID);
    }

    public String hasUserFollowQuestion(String userId, Integer questionId) {

        Integer ret = questionDao.hasUserFollowQuestion(userId, questionId);
        if (ret != null && ret.equals(1)) {
            return "true";
        } else {
            return "false";
        }

    }

    public Integer followQuestion(String localUserId, Integer questionId) {
        return questionDao.followQuestion(localUserId, questionId, new Date().getTime());
    }

    public Integer unfollowQuestion(String localUserId, Integer questionId) {
        return questionDao.unfollowQuestion(localUserId, questionId);
    }

    public void submitAnswer(Answer answer) {
        questionDao.submitAnswer(answer);
    }

    public void updateAnswer(String userId, Integer answerId, String answerContent, Integer questionId) {
        questionDao.updateAnswer(userId, answerId, answerContent, new Date().getTime(), questionId);
    }

    public void deleteAnswer(String answerId) {
        questionDao.deleteAnswer(answerId);
    }

    public void addQuestion(Question question, String userId) {

        questionDao.addQuestion(question, userId, new Date().getTime());

    }

    public void addQuestionTopics(Question question, String topicString) {
        String[] topicStrings = topicString.split("，"); // 用中文逗号
        // 这里可以放到reids当中去查询，更快一点
//        Integer[] topicIds = new Integer[topicStrings.length];
        for (int i = 0; i < topicStrings.length; i++) {
            Integer topicId = topicDao.getTopicIdByTopicName(topicStrings[i]);
            questionDao.addQuestionTopic(question.getQuestionId(), topicId);
        }
    }

    public List<Topic> getRelatedTopics(Integer qustionId) {
        return questionDao.getRelatedTopics(qustionId);
    }
}
