package com.ilsxh.service;

import com.ilsxh.dao.*;
import com.ilsxh.entity.*;
import com.ilsxh.redis.AnswerKey;
import com.ilsxh.redis.HotDataKey;
import com.ilsxh.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

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

    private QuestionDao questionDao;
    private TopicDao topicDao;
    private HotDao hotDao;
    private RedisService redisService;
    private UserHelperService userHelperService;
    private AnswerDao answerDao;
    private CommentDao commentDao;

    @Autowired
    public QuestionService(QuestionDao questionDao, TopicDao topicDao, HotDao hotDao, RedisService redisService,
                           UserHelperService userHelperService, AnswerDao answerDao, CommentDao commentDao) {
        this.questionDao = questionDao;
        this.topicDao = topicDao;
        this.hotDao = hotDao;
        this.redisService = redisService;
        this.userHelperService = userHelperService;
        this.answerDao = answerDao;
        this.commentDao = commentDao;
    }

    /**
     * 获取用户的关注问题列表
     * @param userId
     * @return
     */
    public List<Question> getFollowingQuestionByUserId(String userId) {

        List<Question> questionList = questionDao.selectFollowingQuestionByUserId(userId);

        for (Question question : questionList) {
            User user = new User();
            user.setUserId(question.getUserId());
            user.setUsername(userHelperService.selectUsernameByUserId(question.getUserId()));
            question.setUser(user);
        }
        return questionList;
    }

    /**
     * 获取用户的推荐问题列表
     * @return
     */
    public List<Question> getRecommendedQuestionByUserId() {
        List<Question> questionList = questionDao.selectRecommendedQuestionByUserId();

        for (Question question : questionList) {
            User user = new User();
            user.setUserId(question.getUserId());
            user.setUsername(userHelperService.selectUsernameByUserId(question.getUserId()));
            question.setUser(user);
        }
        return questionList;
    }

    /**
     * 获取问题的回答列表详情
     * @param questionId
     * @param userId
     * @return
     */
    public List<Answer> getAnswersByQuestionId(Integer questionId, String userId) {

        List<Answer> answerList = questionDao.selectAnswersByQuestionId(questionId);
        for (Answer answer : answerList) {
            this.getDataAboutAnswer(answer, userId);
        }
        return answerList;
    }

    /**
     * 获取用户的提出问题列表
     * @param userId
     * @return
     */
    public List<Question> getRaisedQuestionByUserId(String userId) {
        List<Question> questionList = questionDao.getRaisedQuestionByUserId(userId);

        for (Question question : questionList) {
            User user = new User();
            user.setUserId(question.getUserId());
            user.setUsername(userHelperService.selectUsernameByUserId(question.getUserId()));
            question.setUser(user);
        }
        return questionList;
    }

    /**
     * 获取问题详情
     * @param questionID
     * @return
     */
    public Question getQuestionByQuestionid(Integer questionID) {
        return questionDao.selectQuestionByQuestionId(questionID);
    }

    /**
     * 判断用户是否已经关注了该问题
     * @param userId
     * @param questionId
     * @return
     */
    public String hasUserFollowQuestion(String userId, Integer questionId) {

        Integer ret = questionDao.hasUserFollowQuestion(userId, questionId);
        if (ret != null && ret.equals(1)) {
            return "true";
        } else {
            return "false";
        }
    }

    /**
     * 用户是否已经回答该问题
     * @param userId
     * @param questionId
     * @return
     */
    public Integer isQuestionAnswered(String userId, Integer questionId) {
        Integer ret = questionDao.isQuestionAnswered(userId, questionId);
        if (ret == null || ret == 0) {
            return 0;
        } else {
            return ret;
        }
    }

    /**
     * 用户关注问题
     * @param localUserId
     * @param questionId
     * @return
     */
    public Integer followQuestion(String localUserId, Integer questionId) {
        return questionDao.followQuestion(localUserId, questionId, new Date().getTime());
    }

    /**
     * 用户取消关注问题
     * @param localUserId
     * @param questionId
     * @return
     */
    public Integer unfollowQuestion(String localUserId, Integer questionId) {
        return questionDao.unfollowQuestion(localUserId, questionId);
    }

    /**
     * 提交回答
     * @param answerContent
     * @param questionId
     * @param localUserId
     * @return
     */
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

    /**
     * 更新回答
     * @param userId
     * @param answerId
     * @param answerContent
     * @param questionId
     */
    public void updateAnswer(String userId, Integer answerId, String answerContent, Integer questionId) {
        questionDao.updateAnswer(userId, answerId, answerContent, new Date().getTime(), questionId);
    }

    /**
     * 删除回答
     * @param answerId
     */
    public void deleteAnswer(String answerId) {
        questionDao.deleteAnswer(answerId);
    }

    /**
     * 提出问题
     * @param questionTitle
     * @param questionContent
     * @param topicString
     * @param userId
     * @return
     */
    public Question addQuestion(String questionTitle, String questionContent, String topicString, String userId) {

        Question question = new Question();
        question.setQuestionTitle(questionTitle);
        // 在设置questionContent 之前修改图片的URL
        questionContent = MyUtil.modifyQuestionContent(questionContent, questionTitle);
        question.setQuestionContent(questionContent);
        question.setUserId(userId);
        question.setCreateTime(new Date().getTime());

        questionDao.addQuestion(question, userId, new Date().getTime());
        questionDao.followQuestion(userId, question.getQuestionId(), new Date().getTime());
        this.addQuestionTopics(question, topicString);

        return question;
    }

    /**
     * 为提出的问题设置话题标签集合
     * @param question
     * @param topicString
     */
    public void addQuestionTopics(Question question, String topicString) {
        String[] topicStrings = topicString.split(","); // 用英文逗号
        for (int i = 0; i < topicStrings.length; i++) {
            Integer topicId = topicDao.getTopicIdByTopicName(topicStrings[i]);
            questionDao.addQuestionTopic(question.getQuestionId(), topicId);
        }
    }

    /**
     * 获取问题的相关话题标签
     * @param qustionId
     * @return
     */
    public List<Topic> getRelatedTopics(Integer qustionId) {
        return questionDao.getRelatedTopics(qustionId);
    }

    /**
     * 提问键入文字，实时获取相关问题并显示，供用户选择
     * @param partialWord
     * @return
     */
    public List<Question> getProbablyRelativeQestions(@PathVariable String partialWord) {
        return questionDao.getProbablyRelativeQestions(partialWord);
    }

    /**
     * 获取热点数据，从缓存中取，并且十分钟更新一次
     *
     * @param model
     */
    public void getCommonHotData(Model model) {

        List<Question> hotQuestions = redisService.getList(HotDataKey.hotQuestionKey, "", Question.class);
        if (hotQuestions == null) {
            hotQuestions = hotDao.getHotQuestions();
            redisService.setList(HotDataKey.hotQuestionKey, "", hotQuestions);
        }
        model.addAttribute("hotQuestions", hotQuestions);

        List<User> hotUsers = redisService.getList(HotDataKey.hotUserKey, "", User.class);
        if (hotUsers == null) {
            hotUsers = hotDao.getHotUsers();
            redisService.setList(HotDataKey.hotUserKey, "", hotUsers);
        }
        model.addAttribute("hotUsers", hotUsers);

        List<Topic> hotTopics = redisService.getList(HotDataKey.hotTopicsKey, "", Topic.class);
        if (hotTopics == null) {
            hotTopics = hotDao.getHotTopics();
            redisService.setList(HotDataKey.hotTopicsKey, "", hotTopics);
        }
        model.addAttribute("hotTopics", hotTopics);

        List<Question> newestQuestions = redisService.getList(HotDataKey.newestQuestionKey, "", Question.class);
        if (newestQuestions == null) {
            newestQuestions = hotDao.getNewestRaisedQuestions();
            redisService.setList(HotDataKey.newestQuestionKey, "", newestQuestions);
        }
        model.addAttribute("newestQuestions", newestQuestions);
    }

    /**
     * 获取一些公共的回答信息
     * @param answer
     * @param userId
     */
    public void getDataAboutAnswer(Answer answer, String userId) {
        User user = userHelperService.getUserByUserId(answer.getAnswerUserId());
        Integer upOrDownVote = answerDao.getUserVoteStatus(answer.getAnswerId(), userId);
        Integer isCollectAnswer = answerDao.isCollectAnswer(answer.getAnswerId(), userId);
        // 获取答主关注状态，是否被关注
        Integer userFollowStatus = userHelperService.getUserFollowStatus(userId, answer.getAnswerUserId());
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
        List<AnswerComment> answerCommentList = commentDao.listAnswerCommentByAnswerId(answer.getAnswerId(), "REPLY_TARGET_NOT_EXISTS");
        for (AnswerComment comment : answerCommentList) {
            // 为评论绑定用户信息
            User commentUser = userHelperService.getUserByUserId(comment.getUserId());
            comment.setUser(commentUser);
            // 判断用户是否赞过该评论
//            Long rank = jedis.zrank(userId + RedisKey.LIKE_ANSWER_COMMENT, comment.getAnswerCommentId() + "");
//            comment.setLikeState(rank == null ? "false" : "true");
            // 获取该评论被点赞次数
//            Long likedCount = jedis.zcard(comment.getAnswerCommentId() + RedisKey.LIKED_ANSWER_COMMENT);
            comment.setLikedCount(Integer.valueOf(1));

            List<AnswerComment> replyCommentList = commentDao.listAnswerCommentByAnswerId1(answer.getAnswerId(), "REPLY_TARGET_EXISTS");

            for (AnswerComment replyComment : replyCommentList) {
                // 为评论绑定用户信息
                User replyCommentUser = userHelperService.getUserByUserId(replyComment.getUserId());
                replyComment.setUser(replyCommentUser);
                replyComment.setLikedCount(Integer.valueOf(1));
            }
            comment.setCommentReplyList(replyCommentList);
        }

        answer.setAnswerCommentList(answerCommentList);

    }

    public void getQuestionDetail(String userId, Integer questionId, Model model) {
        User user = userHelperService.getUserByUserId(userId);
        String hasFollowQuestion = this.hasUserFollowQuestion(userId, questionId);

        List<Answer> answerList = this.getAnswersByQuestionId(questionId, userId);
        Question question = this.getQuestionByQuestionid(questionId);

        Integer localUserAnswerId = this.isQuestionAnswered(userId, questionId);
        model.addAttribute("user", user);
        model.addAttribute("localUserAnswer", localUserAnswerId);

        List<Topic> relatedTopicList = this.getRelatedTopics(questionId);
        model.addAttribute("relatedTopicList", relatedTopicList);

        model.addAttribute("hasFollowQuestion", hasFollowQuestion);
        model.addAttribute("answerList", answerList);
        model.addAttribute("questionDetail", question);
    }
}
