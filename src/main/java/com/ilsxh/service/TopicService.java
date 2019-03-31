package com.ilsxh.service;

import com.ilsxh.annotation.OperAnnotation;
import com.ilsxh.dao.*;
import com.ilsxh.entity.*;
import com.ilsxh.redis.TopicKey;
import com.ilsxh.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

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
     *
     * @param topicId
     * @return
     */
    @OperAnnotation(descpition = "获取话题详情", include = "topicId")
    public Topic getTopicByTopicId(Integer topicId) {
        return topicDao.getTopicByTopicId(topicId);
    }

    /**
     * 获取话题页面侧边连数据
     *
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
            relatedQuestion = questionService.getRecommendedQuestionByUserId(userId);
            redisService.setList(TopicKey.relatedQuestionKey, "topicId:" + topicId.toString(), relatedQuestion);
        }
        model.addAttribute("relatedQuestion", relatedQuestion);

        // 侧边栏相关优秀回答用户
        List<User> relatedExcellentUsers = redisService.getList(TopicKey.relatedExcellentUserKey, topicId.toString(), User.class);
        if (relatedExcellentUsers == null) {
            // 这里获取优秀回答用户要用其他算法实现，这个只是暂时的
            relatedExcellentUsers = userHelperService.getollowingUserByUserId(userId, 10);
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
     *
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
     *
     * @param topicId
     * @return
     */
    @OperAnnotation(descpition = "获取话题相关的问题列表")
    public List<Question> getQuestionWithThisTopic(Integer topicId) {
        return topicDao.getQuestionWithThisTopic(topicId);
    }

    /**
     * 获取话题下相关的回答
     *
     * @param userId
     * @param topicId
     * @return
     */
    @OperAnnotation(descpition = "获取话题下相关的回答")
    public List<Answer> getAnswersByTopicId(String userId, Integer topicId) {
        List<Answer> answerList = topicDao.getAnswersByTopicId(topicId);
        for (Answer answer : answerList) {
            questionService.getDataAboutAnswer(answer, userId);
        }
        return answerList;
    }

    /**
     * 获取话题下优秀的回答用户
     *
     * @param topicId
     * @return
     */
    @OperAnnotation(descpition = "获取话题下优秀的回答用户")
    public List<User> getExcellentUsersByTopicId(Integer topicId) {
        return topicDao.getollowingUserByUserId(topicId);
    }

    /**
     * 获取话题页面下相关的话题列表
     *
     * @param partialWord
     * @return
     */
    @OperAnnotation(descpition = "获取话题页面下相关的话题列表")
    public List<Topic> getProbablyRelativeTopics(String partialWord) {
        return topicDao.getProbablyRelativeTopics(partialWord);
    }

    /**
     * 关注话题
     *
     * @param localUserId
     * @param topicId
     * @return
     */
    @OperAnnotation(descpition = "关注话题")
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
     *
     * @param localUserId
     * @param topicId
     * @return
     */
    @OperAnnotation(descpition = "取消关注话题")
    public Integer unfollowTopic(String localUserId, Integer topicId) {
        Integer retStat = -1;
        retStat = topicDao.updateFollowTopic(localUserId, topicId, 0);
        return retStat;
    }

    /**
     * 获取当前用户关注话题状态
     *
     * @param userId
     * @param topicId
     * @return
     */
    public Integer getCurrStatInDB(String userId, Integer topicId) {
        Integer retStat = topicDao.getCurrStat(userId, topicId);
        return retStat;
    }


    public List<Topic> getAllTopics() {
        List<Topic> tempList = topicDao.getAllTopicsFromColdStart();

        List<Topic> returnList = new ArrayList<>();
        for (Topic topic : tempList) {
            if (topic.getParentTopicId() == 0) {
                returnList.add(topic);
            }
        }

        for (Topic rootTopic : returnList) {
            rootTopic.setSubTopicList(new ArrayList());
        }

        for (Topic topic : tempList) {

            for (Topic rootTopic : returnList) {
                if (rootTopic.getTopicId().equals(topic.getParentTopicId())) {
                    rootTopic.getSubTopicList().add(topic);
                }
            }
        }
        return returnList;
    }

    public List<Topic> getPreference(String userId) {
        List<Topic> tempList = topicDao.getAllTopicsFromColdStart();

        List<Topic> returnList = new ArrayList<>();
        for (Topic topic : tempList) {
            if (topic.getParentTopicId() == 0) {
                returnList.add(topic);
            }
        }

        for (Topic rootTopic : returnList) {
            rootTopic.setSubTopicList(new ArrayList());
        }

        for (Topic topic : tempList) {

            for (Topic rootTopic : returnList) {
                if (rootTopic.getTopicId().equals(topic.getParentTopicId())) {
                    rootTopic.getSubTopicList().add(topic);
                }
            }
        }
        return returnList;
    }

    /**
     * 用户首次登录，设置用户偏好，标签可以保存到redis中去
     *
     * @param userId
     * @param chosedTopicIds
     */
    public void insertUserFollowTopics(String userId, List<Integer> chosedTopicIds) {
        // 首次登录，直接insert选中的话题标签
        topicDao.insertFollowTopicWhenFirstLogin(userId, chosedTopicIds);
    }

    /**
     * 用户修改个人偏好，标签可以保存到redis中去，前端异步执行，
     *
     * @param userId
     * @param newTopicIdsSet
     */
    public void updateUserFollowTopics(String userId, Set<Integer> newTopicIdsSet) {

        List<Topic> followedTopicList = topicDao.getFollowingTopicByUserId(userId, null, null);
        Set<Integer> followedTopicSet = new HashSet<>();

        // 已关注的话题集合
        followedTopicList.stream().forEach(t -> {
            followedTopicSet.add(t.getTopicId());
        });

        // 首先要把原有的集合复制一份
        Set<Integer> followTopicIdCopy = new HashSet<>();
        followTopicIdCopy.addAll(followedTopicSet);

        // 得到取消关注的话题集合
        followTopicIdCopy.removeAll(newTopicIdsSet);
        List<Integer> unfollowTopicIds = new ArrayList<>(followTopicIdCopy);
        // 更新操作，直接更新状态码
        if (unfollowTopicIds.size() != 0) {
            topicDao.deleteFollowTopicByUserId(userId, unfollowTopicIds);
        }


        Set<Integer> newfollowTopicIdCopy = new HashSet<>();
        newfollowTopicIdCopy.addAll(newTopicIdsSet);
        // 得到新增加的话题集合
        newfollowTopicIdCopy.removeAll(followedTopicSet);
        List<Integer> newFollowTopicIds = new ArrayList<>(newfollowTopicIdCopy);
        // 直接插入新的记录，状态码设置为1
        if (newFollowTopicIds.size() != 0) {
            topicDao.insertFollowTopicWhenFirstLogin(userId, newFollowTopicIds);
        }
    }

    /**
     * 获取标签内容，共首次登录的用户选择
     *
     * @param userId
     * @param rootTopicId
     * @return
     */
    public Map<String, List<Topic>> getSocialScienceTopics(String userId, Integer rootTopicId) {

        Map<String, List<Topic>> retMap = new HashMap<>();

        List<Topic> secondSubTopicList = topicDao.getChilrenTopicByTopicId(userId, rootTopicId);

        // 每一个二级话题标签下的三级标签，需要判断是否已经被关注过
        for (Topic topic : secondSubTopicList) {
            List<Topic> thirdTopicList = topicDao.getAllThirdTopics(topic.getTopicId());
            List<Integer> followedThirdTopicIdList = topicDao.getFollowedThirdTopics(userId, topic.getTopicId());

            for (Topic t : thirdTopicList) {
                for (Integer topicId : followedThirdTopicIdList) {
                    if (topicId.intValue() == t.getTopicId().intValue()) {
                        t.setTopicFollowd(1);
                        followedThirdTopicIdList.remove(topicId);
                        break;
                    } else {
                        t.setTopicFollowd(0);
                    }
                }
            }

            retMap.put(topic.getTopicId() + "-" + topic.getTopicFollowd(), thirdTopicList);
        }

        return retMap;
    }


    public Page<Topic> getFollowingTopicByUserId(String userId, Integer pageNo) {

        int totalFolowingTopicNum = topicDao.getFollowingTopicNum(userId);
        int pageSize = 30;

        List<Topic> retList = topicDao.getFollowingTopicByUserId(userId, (pageNo - 1) * pageSize, pageSize);

        Page<Topic> page = new Page<Topic>(pageSize, pageNo, totalFolowingTopicNum, retList);
        return page;
    }
}
