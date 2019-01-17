package com.ilsxh.service;

import com.ilsxh.dao.*;
import com.ilsxh.entity.*;
import com.ilsxh.redis.TopicKey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class TopicService {

    private TopicDao topicDao;
    private RedisService redisService;
    private QuestionService questionService;
    private HotDao hotDao;
    private UserHelperService userHelperService;

    @Autowired
    public TopicService(TopicDao topicDao, RedisService redisService, QuestionService questionService,
                        HotDao hotDao, UserHelperService userHelperService) {
        this.topicDao = topicDao;
        this.redisService = redisService;
        this.questionService = questionService;
        this.hotDao = hotDao;
        this.userHelperService = userHelperService;
    }

    /**
     * 获取话题详情
     * @param topicId
     * @return
     */
    public Topic getTopicByTopicId(Integer topicId) {
        return topicDao.getTopicByTopicId(topicId);
    }

    /**
     * 获取话题页面侧边连数据
     * @param topicId
     * @param userId
     * @param model
     */
    public void getSideCardInfo(Integer topicId, String userId, Model model) {

        // 话题简介
        Topic topic = getTopicByTopicId(topicId);
        model.addAttribute("topic", topic);

        // 登录用户
        User user = userHelperService.getUserByUserId(userId);
        model.addAttribute("user", user);

        // 侧边栏相关话题

        List<Question> relatedQuestion = redisService.getList(TopicKey.relatedQuestionKey, topicId.toString(), Question.class);
        if (relatedQuestion == null) {
            relatedQuestion = questionService.getRecommendedQuestionByUserId();
            redisService.setList(TopicKey.relatedQuestionKey, "topicId:" + topicId.toString(), relatedQuestion);
        }
        model.addAttribute("relatedQuestion", relatedQuestion);

        // 侧边栏相关优秀回答用户
        List<User> relatedExcellentUsers = redisService.getList(TopicKey.relatedExcellentUserKey, topicId.toString(), User.class);
        if (relatedExcellentUsers == null) {
            relatedExcellentUsers = userHelperService.getollowingUserByUserId(userId);
            redisService.setList(TopicKey.relatedExcellentUserKey, "topicId:" + topicId.toString(), relatedExcellentUsers);
        }
        model.addAttribute("relatedExcellentUsers", relatedExcellentUsers);

        // 侧边栏相关话题
        List<Topic> relatedTopics = redisService.getList(TopicKey.relatedTopicKey, topicId.toString(), Topic.class);
        if (relatedTopics == null) {
            relatedTopics = hotDao.getHotTopics();
            redisService.setList(TopicKey.relatedTopicKey, "topicId:" + topicId.toString(), relatedTopics);
        }
        model.addAttribute("relatedTopics", relatedTopics);
    }

    /**
     * 话题页面tab中一些公共数据
     * @param topicId
     * @param userId
     * @param model
     */
    public void getTopicDetail(Integer topicId, String userId, Model model) {
        Integer userFollowTopic = this.getCurrStatInDB(userId, topicId);

        model.addAttribute("hasFollowQuestion", questionService.hasUserFollowQuestion(userId, 1));
        model.addAttribute("localUserAnswer", 0);
        model.addAttribute("userFollowTopic", userFollowTopic == null ? 0 : userFollowTopic);
    }

    /**
     * 获取话题相关的问题列表
     * @param topicId
     * @return
     */
    public List<Question> getQuestionWithThisTopic(Integer topicId) {
        return topicDao.getQuestionWithThisTopic(topicId);
    }

    /**
     * 获取话题下相关的回答
     * @param userId
     * @param topicId
     * @return
     */
    public List<Answer> getAnswersByTopicId(String userId, Integer topicId) {
        List<Answer> answerList = topicDao.getAnswersByTopicId(topicId);
        for (Answer answer : answerList) {
            questionService.getDataAboutAnswer(answer, userId);
        }
        return answerList;
    }

    /**
     * 获取话题下优秀的回答用户
     * @param topicId
     * @return
     */
    public List<User> getExcellentUsersByTopicId(Integer topicId) {
        return topicDao.getollowingUserByUserId(topicId);
    }

    /**
     * 获取话题页面下相关的话题列表
     * @param partialWord
     * @return
     */
    public List<Topic> getProbablyRelativeTopics(String partialWord) {
        return topicDao.getProbablyRelativeTopics(partialWord);
    }

    /**
     * 关注话题
     * @param localUserId
     * @param topicId
     * @return
     */
    public Integer followTopic(String localUserId, Integer topicId) {
        Integer retStat = -1;

        Integer currStatInDB = getCurrStatInDB(localUserId, topicId);

        if (currStatInDB == null) {
            retStat = topicDao.insertfollowTopic(localUserId, topicId, 1);
        } else {
            retStat = topicDao.updateFollowTopic(localUserId, topicId, 1);
        }
        return retStat;
    }

    /**
     * 取消关注话题
     * @param localUserId
     * @param topicId
     * @return
     */
    public Integer unfollowTopic(String localUserId, Integer topicId) {
        Integer retStat = -1;
        retStat = topicDao.updateFollowTopic(localUserId, topicId, 0);
        return retStat;
    }

    /**
     * 获取当前用户关注话题状态
     * @param userId
     * @param topicId
     * @return
     */
    public Integer getCurrStatInDB(String userId, Integer topicId) {
        Integer retStat = topicDao.getCurrStat(userId, topicId);
        return retStat;
    }

}
