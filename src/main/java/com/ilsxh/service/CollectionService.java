package com.ilsxh.service;

import com.ilsxh.dao.AnswerDao;
import com.ilsxh.dao.CollectionDao;
import com.ilsxh.dao.QuestionDao;
import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import com.ilsxh.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Service
public class CollectionService {

    private CollectionDao collectionDao;
    private QuestionDao questionDao;
    private AnswerDao answerDao;
    private UserDao userDao;
    private UserHelperService userHelperService;

    @Autowired
    public CollectionService(CollectionDao collectionDao, QuestionDao questionDao, AnswerDao answerDao, UserDao userDao, UserHelperService userHelperService) {
        this.collectionDao = collectionDao;
        this.questionDao = questionDao;
        this.answerDao = answerDao;
        this.userDao = userDao;
        this.userHelperService = userHelperService;
    }

    /**
     * 获取用户的回答收藏列表
     *
     * @param userId
     * @param request
     * @return
     */
    public Page<Answer> getAnswerCollectionByUserId(String userId, Integer pageNo) {

        int tatalCollectionNum = collectionDao.getTotalCollectionNum(userId);
        int pageSize = 30;

        List<Answer> answerCollectionList = collectionDao.getAnswerCollectionByUserId(userId, (pageNo - 1) * pageSize, pageSize);

        for (Answer answer : answerCollectionList) {
            Question question = questionDao.selectQuestionByQuestionId(answer.getQuestionId());
            User user = userHelperService.getUserByUserId(answer.getAnswerUserId());
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
        return new Page<>(pageNo, pageSize, tatalCollectionNum, answerCollectionList);
    }
}
