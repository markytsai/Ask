package com.ilsxh.service;

import com.ilsxh.dao.*;
import com.ilsxh.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class TopicService {

    @Autowired
    private TopicDao topicDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private AnswerDao answerDao;

    @Autowired
    private CommentDao commentDao;

    @Autowired
    private UserService userService;

    @Autowired
    private QuestionService questionService;

    @Autowired
    private HotService hotService;

    public Topic getTopicByTopicId(Integer topicId) {
        return topicDao.getTopicByTopicId(topicId);
    }

    public void getSideCardInfo(Integer topicId, HttpServletRequest request, Model model) {

        // 话题简介
        Topic topic = getTopicByTopicId(topicId);
        model.addAttribute("topic", topic);

        // 登录用户
        User user = userService.getUserByUserId(userService.getUserIdFromRedis(request));
        model.addAttribute("user", user);

        // 侧边栏相关话题
        List<Question> relatedQuestion = questionService.getRecommendedQuestionByUserId();
        model.addAttribute("relatedQuestion", relatedQuestion);

        // 侧边栏相关用户
        List<User> relatedExcellentUsers = userService.getollowingUserByUserId(userService.getUserIdFromRedis(request));
        model.addAttribute("relatedExcellentUsers", relatedExcellentUsers);

        // 侧边栏相关话题
        List<Topic> relatedTopics = hotService.getHotTopic();
        model.addAttribute("relatedTopics", relatedTopics);
    }

    public List<Question> getQuestionWithThisTopic(Integer topicId) {
        return topicDao.getQuestionWithThisTopic(topicId);
    }

    public List<Answer> getAnswersByTopicId(String userId, Integer topicId) {
        List<Answer> answerList = topicDao.getAnswersByTopicId(topicId);
        for (Answer answer : answerList) {
            getDataAboutAnswer(answer, userId);
        }
        return answerList;
    }

    public void getDataAboutAnswer(Answer answer, String userId) {
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

        // 获取回答的相关评论
        List<AnswerComment> answerCommentList = commentDao.listAnswerCommentByAnswerId(answer.getAnswerId());
        for (AnswerComment comment : answerCommentList) {
            // 为评论绑定用户信息
            User commentUser = userService.getUserByUserId(comment.getUserId());
            comment.setUser(commentUser);
            // 判断用户是否赞过该评论
//            Long rank = jedis.zrank(userId + RedisKey.LIKE_ANSWER_COMMENT, comment.getAnswerCommentId() + "");
//            comment.setLikeState(rank == null ? "false" : "true");
            // 获取该评论被点赞次数
//            Long likedCount = jedis.zcard(comment.getAnswerCommentId() + RedisKey.LIKED_ANSWER_COMMENT);
            comment.setLikedCount(Integer.valueOf(1));

        }
        answer.setAnswerCommentList(answerCommentList);

    }

    public List<User> getExcellentUsersByTopicId(Integer topicId) {
        return topicDao.getollowingUserByUserId(topicId);
    }

    public List<Topic> getProbablyRelativeTopics(String partialWord) {
        return topicDao.getProbablyRelativeTopics(partialWord);
    }

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

    public Integer unfollowTopic(String localUserId, Integer topicId) {
        Integer retStat = -1;
        retStat = topicDao.updateFollowTopic(localUserId, topicId, 0);
        return retStat;
    }

    public Integer getCurrStatInDB(String userId, Integer topicId) {
        Integer retStat = topicDao.getCurrStat(userId, topicId);
        return retStat;
    }

}
