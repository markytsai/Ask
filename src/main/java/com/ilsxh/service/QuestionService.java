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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import java.sql.Timestamp;
import java.util.*;

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

        // 获取登录用户的相似用户集合
        Set<String> similarUsers = this.getSimilarUserSet(2, userId);
        Map<String, Set<Integer>> userRecommendQuestionMap = new HashMap<>();

        List<Integer> recommendQuestionIdList = new ArrayList<>();

        for (Iterator iterator = similarUsers.iterator(); iterator.hasNext(); ) {
            String userId1 = (String) iterator.next();

            // 遍历相似用户集合，计算得到用户感兴趣的话题
            Set<Integer> set = this.getUserInterestedQuestions(userId1);
            userRecommendQuestionMap.put(userId1, set);

            if (trainDao.getUserInterestedQuestionIds(userId1) == null) {
                trainDao.insertUserRecommendQuestion(userId1, JSONArray.toJSONString((set)));
            } else {
                trainDao.updateUserRecommendQuestion(userId1, JSONArray.toJSONString(set));
            }

            String questionIds = trainDao.getRecommendQuestionByUserId(userId1);
            List<Integer> questionIdList = JSONObject.parseArray(questionIds, Integer.class);
            recommendQuestionIdList.addAll(questionIdList);

            for (Iterator iterator1 = set.iterator(); iterator1.hasNext(); ) {
                System.out.print("similar question number : " + iterator1.next() + "  ");
            }
            System.out.println();
        }

        Set<Integer> recommendQuestionIdsSet = this.questionCF(1, userId);
        recommendQuestionIdsSet.stream().forEach(x -> recommendQuestionIdList.add(x));

        List<Question> questionList = questionDao.getQuestionListById(recommendQuestionIdList);

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
        return questionDao.followQuestion(localUserId, questionId, new Timestamp(System.currentTimeMillis()));
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

        questionDao.submitAnswer(answer);

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
        return effectRow;
    }

    /**
     * 删除回答
     *
     * @param answerId
     */
    public Integer deleteAnswer(String answerId) {
        Integer effectRow = questionDao.deleteAnswer(answerId);
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
    public Question addQuestion(String questionTitle, String questionContent, String topicString, String userId) {

        Question question = new Question();
        question.setQuestionTitle(questionTitle);
        // 在设置questionContent 之前修改图片的URL
        questionContent = MyUtil.modifyQuestionContent(questionContent, questionTitle);
        question.setQuestionContent(questionContent);
        question.setUserId(userId);
        question.setCreateTime(new Timestamp(System.currentTimeMillis()));

        questionDao.addQuestion(question, userId, new Timestamp(System.currentTimeMillis()));
        questionDao.followQuestion(userId, question.getQuestionId(), new Timestamp(System.currentTimeMillis()));
        this.addQuestionTopics(question, topicString);

        return question;
    }

    /**
     * 为提出的问题设置话题标签集合
     *
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

    /**
     * 通过矩阵计算，得到前topK的相似用户集合，计算依据：用户关注话题
     *
     * @param topK
     * @param targetUserId
     * @return
     */
    public Set<String> getSimilarUserSet(int topK, String targetUserId) {

        List<UserTopicVo> list = trainDao.getAllUserTopic();
//        list.stream().forEach(x -> System.out.println(x.getId()));

        // 通过set获取人数
        Set<String> set = new HashSet<>();
        for (UserTopicVo userTopicVo : list) {
            set.add(userTopicVo.getUserId());
        }
        int userNum = set.size();
        System.out.println("Total user number: " + set.size());

        String[] userIds = new String[userNum];
        int n = 0;
        // 用户user_id 和 矩阵序号的 对照map
        Map<String, Integer> userIdSerialMap = new HashMap<>(userNum);
        int serialNum = 0;
        for (String s : set) {
            userIdSerialMap.put(s, serialNum++);
            userIds[n++] = s;
        }

        // 初始化关注集合<user_id对应的矩阵序号， 话题set>
        Map<Integer, Set<Integer>> map = new HashMap<>();
        for (Map.Entry<String, Integer> entry : userIdSerialMap.entrySet()) {
            map.put(entry.getValue(), new HashSet<>());
        }

        // 遍历列表，按照user_id进行归类
        for (UserTopicVo userTopicVo : list) {
            map.get(userIdSerialMap.get(userTopicVo.getUserId())).add(userTopicVo.getTopicId());
        }

        // set size = 4
        double[][] similarityMatrix = new double[userNum][userNum];
        Set<Integer> result = new HashSet<Integer>();
        for (int i = 0; i < userNum; i++) {
            for (int j = i + 1; j < userNum; j++) {

                result.clear();

                Set setA = map.get(i);
                int ASize = setA.size();
                result.addAll(setA);

                Set setB = map.get(j);
                int BSize = setB.size();

                result.retainAll(setB);

                similarityMatrix[i][j] = similarityMatrix[j][i] = result.size() / (Math.sqrt(ASize * BSize) * 1.0);
            }
        }

        double tempArr[] = new double[similarityMatrix.length];
        int k = 0;
        for (double num : similarityMatrix[userIdSerialMap.get(targetUserId)]) {
            tempArr[k++] = num;
        }

        Arrays.sort(tempArr);
        Set<String> retUsers = new HashSet<>();

        for (int j = userNum - 1; j >= userNum - topK; j--) {
            for (int i = 0; i < userNum; i++) {
                if (i != j && similarityMatrix[userIdSerialMap.get(targetUserId)][i] == tempArr[j]) {
                    retUsers.add(userIds[i]);
                    similarityMatrix[userIdSerialMap.get(targetUserId)][i] = 0.0;
                    break;
                }
            }
        }

        return retUsers;
    }

    /**
     * 返回用户强关注问题序号列表
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

        for (UserQuestionVo userQuestionVo : userQuestionVoList) {
            int matrixId = questionIdMatrixIdLinkMap.get(userQuestionVo.getQuestionId());
            questionUserMap.get(matrixId).add(userQuestionVo.getUserId());

            if (userQuestionVo.getUserId().equals(userId)) {
                targetUserFollowQuestionSet.add(userQuestionVo.getQuestionId());
            }
        }


        double[][] questionSimilarityMatrix = new double[questionNum][questionNum];
//        Arrays.fill(questionSimilarityMatrix, 0.0);

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
            double[] tempCompArray = new double[questionNum];
            tempCompArray = Arrays.copyOf(questionSimilarityMatrix[matrixRow], questionNum);
            Arrays.sort(tempCompArray);
            for (int k = questionNum - 1; k >= questionNum - topK; k--) {
                for (int l = 0; l < questionNum; l++) {
                    if (k != l && questionSimilarityMatrix[matrixRow][l] == tempCompArray[k]) {
                        recommendQuestionIdsSet.add(fromMatrixIdToQuestionIdLink[l]);
                        break;
                    }
                }
            }


            System.out.println(questionId);
        }
        return recommendQuestionIdsSet;
    }

    public Integer getTotalQuestionNum(String userId) {
        return questionDao.getTotalQuestionNum(userId);
    }
}
