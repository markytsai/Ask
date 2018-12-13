package com.ilsxh.service;

import com.ilsxh.dao.AnswerDao;
import com.ilsxh.dao.QuestionDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnswerService {

    public final static Integer UPVOTE_FOR_ANSWER = 1;
    public final static Integer DOWNVOTE_FOR_ANSWER = -1;
    public final static Integer NOT_VOTE_FOR_ANSWER = 0;

    @Autowired
    private AnswerDao answerDao;

    public void upvoteAnswer(String localUserId, String answerId, Integer userVote) {
        Boolean isVoteSucessful = Boolean.FALSE;
        Boolean isupdateVoteSucessful = Boolean.FALSE;

        if (userVote != null && userVote == DOWNVOTE_FOR_ANSWER) {
            // mid_user_vote_answer中间表更新vote字段为1，赞同
            answerDao.voteAnswer(localUserId, answerId, UPVOTE_FOR_ANSWER);
            // 更新answer表赞同反对统计次数
            answerDao.increAnswerUpVote(answerId);
        } else if (userVote == NOT_VOTE_FOR_ANSWER) {
            answerDao.voteAnswer(localUserId, answerId, UPVOTE_FOR_ANSWER);
            answerDao.increAnswerUpVoteOnly(answerId);
        } else {
            answerDao.voteAnswer(localUserId, answerId, NOT_VOTE_FOR_ANSWER);
            answerDao.decreAnswerUpVoteOnly(answerId);
        }
    }

    public void downvoteAnswer(String localUserId, String answerId, Integer userVote) {
        if (userVote != null && userVote == DOWNVOTE_FOR_ANSWER) {
            answerDao.voteAnswer(localUserId, answerId, NOT_VOTE_FOR_ANSWER);
            answerDao.decreAnswerDownVoteOnly(answerId);
        } else if (userVote == NOT_VOTE_FOR_ANSWER) {
            answerDao.voteAnswer(localUserId, answerId, DOWNVOTE_FOR_ANSWER);
            answerDao.increAnswerDownVoteOnly(answerId);
        } else {
            answerDao.voteAnswer(localUserId, answerId, DOWNVOTE_FOR_ANSWER);
            answerDao.increAnswerDownVote(answerId);
        }
    }


}
