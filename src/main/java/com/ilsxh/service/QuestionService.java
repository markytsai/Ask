package com.ilsxh.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ilsxh.annotation.OperAnnotation;
import com.ilsxh.dao.*;
import com.ilsxh.entity.*;
import com.ilsxh.enums.StatusEnum;
import com.ilsxh.exception.CustomException;
import com.ilsxh.redis.AnswerKey;
import com.ilsxh.redis.HotDataKey;
import com.ilsxh.util.MyUtil;
import com.ilsxh.util.Page;
import com.ilsxh.vo.UserQuestionVo;
import com.ilsxh.vo.UserTopicVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import java.sql.Timestamp;
import java.util.*;

/**
 * @author Tsaizhenya
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
    private TrainDao trainDao;

    @Autowired
    public QuestionService(QuestionDao questionDao, TopicDao topicDao, HotDao hotDao, RedisService redisService,
                           UserHelperService userHelperService, AnswerDao answerDao, CommentDao commentDao, TrainDao trainDao) {
        this.questionDao = questionDao;
        this.topicDao = topicDao;
        this.hotDao = hotDao;
        this.redisService = redisService;
        this.userHelperService = userHelperService;
        this.answerDao = answerDao;
        this.commentDao = commentDao;
        this.trainDao = trainDao;
    }

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 获取用户的关注问题列表
     *
     * @param userId
     * @return
     */
    @OperAnnotation(descpition = "获取用户关注问题列表", include = "userId")
    public List<Question> getFollowingQuestionByUserId(String userId, Integer pageNo, Integer pageSize) {

        List<Question> questionList = questionDao.selectFollowingQuestionByUserId(userId, pageNo, pageSize);

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
     *
     * @return
     */
    @OperAnnotation(descpition = "获取用户推荐问题列表")
    public List<Question> getRecommendedQuestionByUserId(String userId) {

        // 获取登录用户的相似用户集合，选取其中两个最高的
        Set<String> similarUsers = this.getSimilarUserSet(2, userId);

        // 持久化相似用户列表
//        trainDao.storeSimilarUser2Db(userId, similarUsers);


        // 用来存 相似用户 所感兴趣的问题集合
//        Map<String, Set<Integer>> userRecommendQuestionMap = new HashMap<>();

        List<Integer> recommendQuestionIdList = new ArrayList<>();

        // 遍历得到的相似用户集合，集合为userId
        for (Iterator iterator = similarUsers.iterator(); iterator.hasNext(); ) {
            String userId1 = (String) iterator.next();

            // 遍历相似用户集合，计算得到单个用户感兴趣的话题，作为推荐问题给目标用户
            Set<Integer> set = this.getUserInterestedQuestions(userId1);
//            userRecommendQuestionMap.put(userId1, set);

            // 推荐的问题 持久化，， 这里持久化只存了 userCF 的推荐结果
            if (trainDao.getUserInterestedQuestionIds(userId1) == null) {
                trainDao.insertUserRecommendQuestion(userId1, JSONArray.toJSONString((set)));
            } else {
                trainDao.updateUserRecommendQuestion(userId1, JSONArray.toJSONString(set));
            }

            // 从数据库中获取推荐的问题集合，添加到待返回的集合中去
            String questionIds = trainDao.getRecommendQuestionByUserId(userId1);
            List<Integer> questionIdList = JSONObject.parseArray(questionIds, Integer.class);
            recommendQuestionIdList.addAll(questionIdList);
        }

        // ItemCF算法得到的问题推荐集合
//        Set<Integer> recommendQuestionIdsSet = this.questionCF(1, userId);

        // 暂时把userCF和ItemCF的推荐结果放在一起
//        recommendQuestionIdsSet.stream().forEach(x -> recommendQuestionIdList.add(x));

        // 获取具体问题实体信息
        List<Question> questionList = questionDao.getQuestionListById(recommendQuestionIdList);

        for (Question question : questionList) {
            User user = new User();
            user.setUserId(question.getUserId());
            user.setUsername(userHelperService.selectUsernameByUserId(question.getUserId()));
            question.setUser(user);
        }
        logger.info("用户{}成功获取推荐问题列表{}", userId, recommendQuestionIdList);

        return questionList;
    }

    /**
     * 获取问题的回答列表详情
     *
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
     *
     * @param userId
     * @return
     */
    public Page<Question> getRaisedQuestionByUserId(String userId, Integer pageNo) {
        int totalQuestion = questionDao.getTotalQuestions(userId);
        int pageSize = 30;
        List<Question> questionList = questionDao.getRaisedQuestionByUserId(userId, (pageNo - 1) * pageSize, pageSize);

        for (Question question : questionList) {
            User user = new User();
            user.setUserId(question.getUserId());
            user.setUsername(userHelperService.selectUsernameByUserId(question.getUserId()));
            question.setUser(user);
        }
        return new Page<>(pageNo, pageSize, totalQuestion, questionList);
    }

    /**
     * 获取问题详情
     *
     * @param questionID
     * @return
     */
    public Question getQuestionByQuestionid(Integer questionID) {
        return questionDao.selectQuestionByQuestionId(questionID);
    }

    /**
     * 判断用户是否已经关注了该问题
     *
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
     *
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
     *
     * @param localUserId
     * @param questionId
     * @return
     */
    @OperAnnotation(descpition = "关注问题")
    public Integer followQuestion(String localUserId, Integer questionId) {
        Integer effectNum = questionDao.followQuestion(localUserId, questionId, new Timestamp(System.currentTimeMillis()));
        if (null == effectNum || effectNum.intValue() == 0) {
            logger.info("关注问题出现错误: 用户序号{}, 问题序号{}", localUserId, questionId);
        }
        return effectNum;
    }

    /**
     * 用户取消关注问题
     *
     * @param localUserId
     * @param questionId
     * @return
     */
    @OperAnnotation(descpition = "取消关注问题")
    public Integer unfollowQuestion(String localUserId, Integer questionId) {
        Integer effectRow = questionDao.unfollowQuestion(localUserId, questionId);
        if (null == effectRow || effectRow.intValue() == 0) {
            logger.info("取消关注问题出现错误: 用户序号{}, 问题序号{}", localUserId, questionId);
        }
        return effectRow;
    }

    /**
     * 提交回答
     *
     * @param answerContent
     * @param questionId
     * @param localUserId
     * @return
     */
    @OperAnnotation(descpition = "提交回答", include = "userId")
    public Answer submitAnswer(String answerContent, Integer questionId, String localUserId) {
        Answer answer = new Answer();
        answer.setAnswerUserId(localUserId);

        MyUtil.modifAnswerContent(answerContent);

        answer.setAnswerContent(answerContent);
        answer.setQuestionId(questionId);
        answer.setCreateTime(new Timestamp(System.currentTimeMillis()));

        Integer effectNum = questionDao.submitAnswer(answer);
        if (null == effectNum || effectNum.intValue() == 0) {
            logger.info("提交回答出现错误: 用户序号{}, 问题序号{}", localUserId, questionId);
        }

        List<Answer> answerList = this.getAnswersByQuestionId(questionId, localUserId);
        redisService.set(HotDataKey.hotQuestionAnswerListKey, "hotQuestionId-" + questionId, answerList);

        redisService.set(AnswerKey.answerKey, "-" + localUserId + "-" + questionId, answer.getAnswerId());
        return answer;
    }

    /**
     * 更新回答
     *
     * @param userId
     * @param answerId
     * @param answerContent
     * @param questionId
     */
    public Integer updateAnswer(String userId, Integer answerId, String answerContent, Integer questionId) {
        Integer effectRow = questionDao.updateAnswer(userId, answerId, answerContent, new Timestamp(System.currentTimeMillis()), questionId);
        if (null == effectRow || effectRow.intValue() == 0) {
            logger.info("更新回答出现错误: 用户序号{}, 问题序号{}, 回答序号{}", userId, questionId, answerId);
        }

        List<Answer> answerList = this.getAnswersByQuestionId(questionId, userId);
        redisService.set(HotDataKey.hotQuestionAnswerListKey, "hotQuestionId-" + questionId, answerList);
        return effectRow;
    }

    /**
     * 删除回答
     *
     * @param answerId
     */
    public Integer deleteAnswer(String answerId, String userId) {

        Integer questionId = questionDao.getQuestionIdByAnswerId(userId, answerId);
        Integer effectRow = questionDao.deleteAnswer(answerId);
        if (null == effectRow || effectRow.intValue() == 0) {
            logger.info("删除回答出现错误: 用户序号{}, 问题序号{}, 回答序号{}", userId, questionId, answerId);
        }
        List<Answer> answerList = this.getAnswersByQuestionId(questionId, userId);
        redisService.set(HotDataKey.hotQuestionAnswerListKey, "hotQuestionId-" + questionId, answerList);

        return effectRow;
    }

    /**
     * 提出问题
     *
     * @param questionTitle
     * @param questionContent
     * @param topicString
     * @param userId
     * @return
     */
    @OperAnnotation(descpition = "提出问题", include = "questionTitle, topicString, userId")
    public Question addQuestion(String questionTitle, String questionContent, String topicString, String userId) {

        Question question = new Question();
        question.setQuestionTitle(questionTitle);
        // 在设置questionContent 之前修改图片的URL
        questionContent = MyUtil.modifyQuestionContent(questionContent, questionTitle);
        question.setQuestionContent(questionContent);
        question.setUserId(userId);
        question.setCreateTime(new Timestamp(System.currentTimeMillis()));

        List<Integer> topicIdList = this.addQuestionTopics(question, topicString);
        Integer effectRow = questionDao.addQuestion(question, userId, JSON.toJSONString(topicIdList), new Timestamp(System.currentTimeMillis()));
        if (null == effectRow || effectRow.intValue() == 0) {
            logger.info("提出问题出现错误: 用户序号{}, 问题序号{}", userId, question.getQuestionId());
        }
        questionDao.followQuestion(userId, question.getQuestionId(), new Timestamp(System.currentTimeMillis()));

        for (Integer topicId : topicIdList) {
            questionDao.addQuestionTopic(question.getQuestionId(), topicId);
        }
        return question;
    }

    /**
     * 为提出的问题设置话题标签集合
     *
     * @param question
     * @param topicString
     */
    public List<Integer> addQuestionTopics(Question question, String topicString) {
        // 用英文逗号
        String[] topicStrings = topicString.split(",");
        List<Integer> topicIds = new ArrayList<>(topicStrings.length);
        for (int i = 0; i < topicStrings.length; i++) {
            Integer topicId = topicDao.getTopicIdByTopicName(topicStrings[i]);
            topicIds.add(topicId);
        }
        return topicIds;
    }

    /**
     * 获取问题的相关话题标签
     *
     * @param qustionId
     * @return
     */
    public List<Topic> getRelatedTopics(Integer qustionId) {
        return questionDao.getRelatedTopics(qustionId);
    }

    /**
     * 提问键入文字，实时获取相关问题并显示，供用户选择
     *
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

        List<Question> hotQuestions = redisService.getList(HotDataKey.hotQuestionKey, "hotQuestions", Question.class);
        if (hotQuestions == null) {
            hotQuestions = hotDao.getHotQuestions();
            redisService.setList(HotDataKey.hotQuestionKey, "hotQuestions", hotQuestions);
        }
        model.addAttribute("hotQuestions", hotQuestions);

        List<User> hotUsers = redisService.getList(HotDataKey.hotUserKey, "hotUsers", User.class);
        if (hotUsers == null) {
            hotUsers = hotDao.getHotUsers();
            redisService.setList(HotDataKey.hotUserKey, "hotUsers", hotUsers);
        }
        model.addAttribute("hotUsers", hotUsers);

        List<Topic> hotTopics = redisService.getList(HotDataKey.hotTopicsKey, "hotTopics", Topic.class);
        if (hotTopics == null) {
            hotTopics = hotDao.getHotTopics();
            redisService.setList(HotDataKey.hotTopicsKey, "hotTopics", hotTopics);
        }
        model.addAttribute("hotTopics", hotTopics);

        List<Question> newestQuestions = redisService.getList(HotDataKey.newestQuestionKey, "newestQuestions", Question.class);
        if (newestQuestions == null) {
            newestQuestions = hotDao.getNewestRaisedQuestions();
            redisService.setList(HotDataKey.newestQuestionKey, "newestQuestions", newestQuestions);
        }
        model.addAttribute("newestQuestions", newestQuestions);
    }

    /**
     * 获取一些公共的回答信息
     *
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

    @OperAnnotation(descpition = "获取问题详情", include = "userid, questionId, model")
    public Model getQuestionDetail(String userId, Integer questionId, Model model) {

        // 如果是游客身份访问，那么传过来的userId为null，得到的user也是null
        model = userHelperService.getUserDetails(userId, model);

        // 如果是游客身份访问，得到的是"false"
        String hasFollowQuestion = this.hasUserFollowQuestion(userId, questionId);

        List<Answer> answerList = redisService.getList(HotDataKey.hotQuestionAnswerListKey, "hotQuestionId-" + questionId, Answer.class);
        if (answerList == null) {
            answerList = this.getAnswersByQuestionId(questionId, userId);
            redisService.set(HotDataKey.hotQuestionAnswerListKey, "hotQuestionId-" + questionId, answerList);
        }
        model.addAttribute("answerList", answerList);

        Question question = this.getQuestionByQuestionid(questionId);

        Integer localUserAnswerId = this.isQuestionAnswered(userId, questionId);
        model.addAttribute("localUserAnswer", localUserAnswerId);

        List<Topic> relatedTopicList = this.getRelatedTopics(questionId);
        model.addAttribute("relatedTopicList", relatedTopicList);

        model.addAttribute("hasFollowQuestion", hasFollowQuestion);

        model.addAttribute("questionDetail", question);

        return model;
    }

    /**
     * 通过矩阵计算，得到前topK的相似用户集合，计算依据：用户关注话题
     *
     * @param topK
     * @param targetUserId
     * @return
     */
    public Set<String> getSimilarUserSet(int topK, String targetUserId) {

        // 获取所有的此用户关注的话题关系，表mid_user_follow_topic中取数据
        List<UserTopicVo> list = trainDao.getAllUserTopic();

        // 通过set获取人数，共存在用户的数量
        Set<String> set = new HashSet<>(list.size());
        for (UserTopicVo userTopicVo : list) {
            set.add(userTopicVo.getUserId());
        }

        // 用户的数量
        int userNum = set.size();
        System.out.println("Total user number: " + set.size());

        // 矩阵序号对应userId, 因为map从value不能获取到key,所以要有一个反向的映射
        String[] userIds = new String[userNum];
        int n = 0;
        // 用户user_id 和 矩阵序号的 对照map
        // String -> userId; Integer -> 矩阵序号
        Map<String, Integer> userIdSerialMap = new HashMap<>(userNum);
        int serialNum = 0;
        // set存的是userId
        for (String s : set) {
            // 按顺序去除用户的ID，然后匹配到矩阵的序号上去，从0到userNum - 1
            userIdSerialMap.put(s, serialNum++);
            //
            userIds[n++] = s;
        }

        // 初始化关注集合<user_id对应的矩阵序号， 话题set
        Map<Integer, Set<Integer>> map = new HashMap<>();
        for (Map.Entry<String, Integer> entry : userIdSerialMap.entrySet()) {
            map.put(entry.getValue(), new HashSet<>());
        }

        // 遍历列表，按照矩阵序号 进行归类
        // 矩阵序号 <--->  关注的话题集合
        for (UserTopicVo userTopicVo : list) {
            map.get(userIdSerialMap.get(userTopicVo.getUserId())).add(userTopicVo.getTopicId());
        }

        // set size = 4
        double[][] similarityMatrix = new double[userNum][userNum];
        Set<Integer> result = new HashSet<Integer>();
        for (int i = 0; i < userNum; i++) {
            for (int j = i + 1; j < userNum; j++) {

                result.clear();

                // 获取矩阵纵向序号为i的话题集合，
                Set setA = map.get(i);
                int ASize = setA.size();
                result.addAll(setA);

                // 获取矩阵横向序号为j的话题集合
                Set setB = map.get(j);
                int BSize = setB.size();

                // 计算两个集合之间的交集
                result.retainAll(setB);

                // 计算用户i和j的相似度
                similarityMatrix[i][j] = similarityMatrix[j][i] = result.size() / (Math.sqrt(ASize * BSize) * 1.0);
            }
        }

        // 获取目标userId所对应的一行数据，也就是所有其他用户于目标用户相似度暂时存到一个数组中去
        double tempArr[] = new double[similarityMatrix.length];
        int k = 0;
        for (double num : similarityMatrix[userIdSerialMap.get(targetUserId)]) {
            tempArr[k++] = num;
        }

        // 升序排列
        Arrays.sort(tempArr);
        Set<String> retUsers = new HashSet<>();

        // 找到相似度最大的两个用户的矩阵序号
        for (int j = userNum - 1; j >= userNum - topK; j--) {
            for (int i = 0; i < userNum; i++) {
                if (i != j && similarityMatrix[userIdSerialMap.get(targetUserId)][i] == tempArr[j]) {
                    // 获取对应矩阵序号的userId，不能从map反向获取
                    retUsers.add(userIds[i]);
                    similarityMatrix[userIdSerialMap.get(targetUserId)][i] = 0.0;
                    break;
                }
            }
        }
        logger.info("用户{}成功获取相似用户列表", targetUserId);
        return retUsers;
    }

    /**
     * 返回用户强关注问题序号列表，指的是三种关注同时存在的问题：用户关注的问题，问题下的回答有收藏行为和点赞行为
     *
     * @param userId
     * @return
     */
    public Set<Integer> getUserInterestedQuestions(String userId) {

        List<UserQuestionVo> userQuestionVos1 = trainDao.getUserFollowQuestion(userId);
        List<UserQuestionVo> userQuestionVos2 = trainDao.getUserCollectAnswer(userId);
        List<UserQuestionVo> userQuestionVos3 = trainDao.getUserVoteUpAnswer(userId);

        Set<Integer> setContainer1 = new HashSet<>();
        userQuestionVos1.stream().forEach(x -> setContainer1.add(x.getQuestionId()));

        Set<Integer> setContainer2 = new HashSet<>();
        userQuestionVos2.stream().forEach(x -> setContainer2.add(x.getQuestionId()));

        Set<Integer> setContainer3 = new HashSet<>();
        userQuestionVos3.stream().forEach(x -> setContainer3.add(x.getQuestionId()));

        // 得到三个行为同时存在的问题，所谓强关注
        Set<Integer> tempSet = new HashSet<>();
        tempSet.addAll(setContainer1);
        tempSet.retainAll(setContainer2);
        tempSet.retainAll(setContainer3);

        return tempSet;
    }

    /**
     * ItemCF 根据同时关注两个问题的用户个数来确定两个用户之间的强弱关系
     *
     * @param topK
     * @param userId
     * @return
     */
    public Set<Integer> questionCF(int topK, String userId) {
        // 获取数据库中所有的用户关注问题集合
        List<UserQuestionVo> userQuestionVoList = trainDao.getAllUserFollowQuestion();

        // 目标用户关注的问题集合
        Set<Integer> targetUserFollowQuestionSet = new HashSet<>();

        // 计算问题的总数，确定矩阵的边长
        Set<Integer> questionIdSet = new HashSet<>();
        userQuestionVoList.stream().forEach(q -> questionIdSet.add(q.getQuestionId()));
        int questionNum = questionIdSet.size();

        // 计算每一个矩阵序号（也即是问题序号）的对应用户集合
        Map<Integer, Set<String>> questionUserMap = new HashMap<>();

        // 得到问题编号 和 矩阵编号 对照
        Map<Integer, Integer> questionIdMatrixIdLinkMap = new HashMap<>(questionNum);
        int temp = 0;
        // 可以通过矩阵编号获取对应的问题编号
        int[] fromMatrixIdToQuestionIdLink = new int[questionNum];
        for (Integer num : questionIdSet) {
            questionUserMap.put(temp, new HashSet<String>());
            fromMatrixIdToQuestionIdLink[temp] = num;
            questionIdMatrixIdLinkMap.put(num, temp++);
        }

        // 计算得到 每一个问题 关注的用户集合
        for (UserQuestionVo userQuestionVo : userQuestionVoList) {
            int matrixId = questionIdMatrixIdLinkMap.get(userQuestionVo.getQuestionId());
            questionUserMap.get(matrixId).add(userQuestionVo.getUserId());

            // 找到目标用户关注的问题集合， 在后面可以找到每一个问题的相似问题作为推荐结果
            if (userQuestionVo.getUserId().equals(userId)) {
                targetUserFollowQuestionSet.add(userQuestionVo.getQuestionId());
            }
        }


        double[][] questionSimilarityMatrix = new double[questionNum][questionNum];

        // 计算问题相似度矩阵
        Set<String> tempSet = new HashSet<>();
        for (int i = 0; i < questionNum; i++) {
            for (int j = i + 1; j < questionNum; j++) {
                tempSet.clear();

                Set<String> setI = questionUserMap.get(i);
                Set<String> setJ = questionUserMap.get(j);
                tempSet.addAll(setI);
                tempSet.retainAll(setJ);

                questionSimilarityMatrix[i][j] = questionSimilarityMatrix[j][i] =
                        tempSet.size() / Math.sqrt(1.0 * setI.size() * setJ.size());
            }
        }

        // 目标用户推荐问题结果集合
        Set<Integer> recommendQuestionIdsSet = new HashSet<>();

        // 找出目标用户关注的问题集合中  每一个问题最相似的问题推荐给该用户
        for (Integer questionId : targetUserFollowQuestionSet) {

            int matrixRow = questionIdMatrixIdLinkMap.get(questionId);
            double[] tempCompArray = Arrays.copyOf(questionSimilarityMatrix[matrixRow], questionNum);
            Arrays.sort(tempCompArray);
            for (int k = questionNum - 1; k >= questionNum - topK; k--) {
                for (int l = 0; l < questionNum; l++) {
                    if (k != l && questionSimilarityMatrix[matrixRow][l] == tempCompArray[k]) {
                        recommendQuestionIdsSet.add(fromMatrixIdToQuestionIdLink[l]);
                        break;
                    }
                }
            }

            System.out.println("---------ItemCF: similar questionId in question Set: " + questionId + "---------");
        }
        return recommendQuestionIdsSet;
    }

    public Integer getTotalQuestionNum(String userId) {
        return questionDao.getTotalQuestionNum(userId);
    }

    public Integer increQuestionFollowedCount(Integer questionId, Integer increCount) {
        return questionDao.increQuestionFollowedCount(questionId, increCount);
    }
}
