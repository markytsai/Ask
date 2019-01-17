package com.ilsxh.service;

import com.ilsxh.dao.AnswerDao;
import com.ilsxh.redis.AnswerKey;
import com.ilsxh.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Service
public class AnswerService {

    public final static Integer UPVOTE_FOR_ANSWER = 1;
    public final static Integer DOWNVOTE_FOR_ANSWER = -1;
    public final static Integer NOT_VOTE_FOR_ANSWER = 0;

    private AnswerDao answerDao;
    private UserHelperService userHelperService;
    private RedisService redisService;

    @Autowired
    public AnswerService(UserHelperService userHelperService, AnswerDao answerDao, RedisService redisService) {
        this.answerDao = answerDao;
        this.userHelperService = userHelperService;
        this.redisService = redisService;
    }

    /**
     * 投票活动（点赞，反对）bug:
     * @param request
     * @param answerId
     * @param currVoteStatus currrent status for answers
     * @param upOrDownClick  点击了赞同按钮(Integer:1) or 反对按钮(Integer:-1)
     */
    public void vote(HttpServletRequest request, Integer answerId, Integer currVoteStatus, Integer upOrDownClick) {

        String userId = userHelperService.getUserIdFromRedis(request);
        Long createTime = new Date().getTime();

        Integer voteExisted = answerDao.userVoteExisted(answerId, userId);
        if (voteExisted != null && voteExisted == 1) { // 曾经进行过投票活动,数据库中存在记录

            if (upOrDownClick == 1) { // 点击赞同按钮

                if (currVoteStatus != null && currVoteStatus == UPVOTE_FOR_ANSWER) { // 已经赞同
                    // mid_user_vote_answer中间表更新vote字段为1，赞同
                    answerDao.voteAnswer(userId, answerId, NOT_VOTE_FOR_ANSWER, createTime);
                    // 更新answer表赞同反对统计次数
                    answerDao.decreAnswerUpVoteOnly(answerId);
                } else if (currVoteStatus == NOT_VOTE_FOR_ANSWER) { // 未投票
                    answerDao.voteAnswer(userId, answerId, UPVOTE_FOR_ANSWER, createTime);
                    answerDao.increAnswerUpVoteOnly(answerId);
                } else {                                        // 反对
                    answerDao.voteAnswer(userId, answerId, UPVOTE_FOR_ANSWER, createTime);
                    answerDao.increAnswerUpVote(answerId);
                }

            } else { // 点击反对按钮

                if (currVoteStatus != null && currVoteStatus == DOWNVOTE_FOR_ANSWER) {
                    answerDao.voteAnswer(userId, answerId, NOT_VOTE_FOR_ANSWER, createTime);
                    answerDao.decreAnswerDownVoteOnly(answerId);
                } else if (currVoteStatus == NOT_VOTE_FOR_ANSWER) {
                    answerDao.voteAnswer(userId, answerId, DOWNVOTE_FOR_ANSWER, createTime);
                    answerDao.increAnswerDownVoteOnly(answerId);
                } else {
                    answerDao.voteAnswer(userId, answerId, DOWNVOTE_FOR_ANSWER, createTime);
                    answerDao.increAnswerDownVote(answerId);
                }
            }

        } else { // 数据库中不存在记录
            if (upOrDownClick == 1) {
                answerDao.increAnswerUpVoteOnly(answerId);
                answerDao.insertVoteAnswer(userId, answerId, UPVOTE_FOR_ANSWER, createTime); // 赞成或者反对，根据voteToWhich判断
            } else {
                answerDao.insertVoteAnswer(userId, answerId, DOWNVOTE_FOR_ANSWER, createTime); // 赞成或者反对，根据voteToWhich判断
                answerDao.increAnswerDownVoteOnly(answerId);
            }
        }
    }


    /**
     * 取消收藏回答
     * @param answerId
     * @param request
     */
    public Integer cancelCollectAnswer(Integer answerId, HttpServletRequest request) {
        String localUserId = userHelperService.getUserIdFromRedis(request);
        Integer delEffectRow = answerDao.cancelCollectAnswer(localUserId, answerId);
        return delEffectRow;
    }

    /**
     * 收藏回答
     * @param answerId
     * @param request
     */
    public Integer collectAnswer(Integer answerId, HttpServletRequest request) {
        String localUserId = userHelperService.getUserIdFromRedis(request);
        Integer effectRow = answerDao.collectAnswer(localUserId, answerId, new Date().getTime());
        return effectRow;
    }

    /**
     * 获取回答详情
     * @param questionId
     * @param request
     * @return
     */
    public Integer getAnswerId(@PathVariable Integer questionId, HttpServletRequest request) {

        String localUserId = userHelperService.getUserIdFromRedis(request);
        Integer answerId = redisService.get(AnswerKey.answerKey, "-" + localUserId + "-" + questionId, Integer.class);
        return answerId;
    }


}
