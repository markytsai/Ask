package com.ilsxh.service;

import com.ilsxh.dao.AnswerDao;
import com.ilsxh.dao.QuestionDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AnswerService {

    public final static Integer UPVOTE_FOR_ANSWER = 1;
    public final static Integer DOWNVOTE_FOR_ANSWER = -1;
    public final static Integer NOT_VOTE_FOR_ANSWER = 0;

    @Autowired
    private AnswerDao answerDao;

    /**
     * 投票活动（点赞，反对）
     *
     * @param userId
     * @param answerId
     * @param currVoteStatus currrent status for answers
     * @param upOrDownClick  点击了赞同按钮(Integer:1) or 反对按钮(Integer:-1)
     */
    public void vote(String userId, Integer answerId, Integer currVoteStatus, Integer upOrDownClick, Long createTime) {

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


    public void cancelCollectAnswer(String localUserId, Integer answerId) {
        answerDao.cancelCollectAnswer(localUserId, answerId);
    }

    public void collectAnswer(String localUserId, Integer answerId) {
        answerDao.collectAnswer(localUserId, answerId, new Date().getTime());
    }


}
