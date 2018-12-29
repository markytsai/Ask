package com.ilsxh.service;

import com.ilsxh.dao.AnswerDao;
import com.ilsxh.dao.CollectionDao;
import com.ilsxh.dao.QuestionDao;
import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollectionService {

    @Autowired
    private CollectionDao collectionDao;

    @Autowired
    private QuestionDao questionDao;

    @Autowired
    private AnswerDao answerDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserService userService;

    public List<Answer> getAnswerCollectionByUserId(String userId) {

        List<Answer> answerCollectionList = collectionDao.getAnswerCollectionByUserId(userId);

        for (Answer answer : answerCollectionList) {
            Question question = questionDao.selectQuestionByQuestionId(answer.getQuestionId());
            User user = userService.getUserByUserId(answer.getAnswerUserId());
            answer.setQuestion(question);

            // 获取登录用户和被查看直接的收藏，点赞关系
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
        return answerCollectionList;
    }
}
