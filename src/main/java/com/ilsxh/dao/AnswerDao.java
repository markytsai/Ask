package com.ilsxh.dao;

import com.ilsxh.entity.Answer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnswerDao {

    void increAnswerUpVote(@Param("answerId") String answerId);

    void increAnswerDownVote(@Param("answerId") String answerId);

    void increAnswerUpVoteOnly(@Param("answerId") String answerId);

    void increAnswerDownVoteOnly(@Param("answerId") String answerId);

    void decreAnswerUpVoteOnly(@Param("answerId") String answerId);

    void decreAnswerDownVoteOnly(@Param("answerId") String answerId);


    void voteAnswer(@Param("userId") String userId, @Param("answerId") String answerId, @Param("whichVote") Integer whichVote);


    Byte userVote(@Param("answerId") Integer answerId, @Param("userId") String userId);

    Integer isCollectAnswer(@Param("answerId") Integer answerId, @Param("userId") String userId);

    void cancelCollectAnswer(@Param("userId") String userId, @Param("answerId") Integer answerId);

    void collectAnswer(@Param("userId") String userId, @Param("answerId") Integer answerId);
}
