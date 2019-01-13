package com.ilsxh.service;

import com.ilsxh.dao.AnswerDao;
import com.ilsxh.dao.QuestionDao;
import com.ilsxh.dao.TopicDao;
import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.Topic;
import com.ilsxh.entity.User;
import com.ilsxh.redis.AnswerKey;
import com.ilsxh.util.MyUtil;
import com.ilsxh.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

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

    @Autowired
    private RedisService redisService;

    @Autowired
    private TopicService topicService;


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
            topicService.getDataAboutAnswer(answer, userId);

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

    public Answer submitAnswer(String answerContent, Integer questionId, String localUserId) {
        Answer answer = new Answer();
        answer.setAnswerUserId(localUserId);

        MyUtil.modifAnswerContent(answerContent);

        answer.setAnswerContent(answerContent);
        answer.setQuestionId(questionId);
        answer.setCreateTime(new Date().getTime());

        questionDao.submitAnswer(answer);

        redisService.set(AnswerKey.answerKey, "-" + localUserId + "-" + questionId, answer.getAnswerId());
        return answer;
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
        String[] topicStrings = topicString.split(","); // 用英文逗号
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

    public List<Question> getProbablyRelativeQestions(@PathVariable String partialWord) {
        return questionDao.getProbablyRelativeQestions(partialWord);
    }
}
