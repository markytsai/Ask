package com.ilsxh.dao;

import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;

public interface AnswerDao {

    void increAnswerUpVote(@Param("answerId") Integer answerId);

    void increAnswerDownVote(@Param("answerId") Integer answerId);

    void increAnswerUpVoteOnly(@Param("answerId") Integer answerId);

    void increAnswerDownVoteOnly(@Param("answerId") Integer answerId);

    void decreAnswerUpVoteOnly(@Param("answerId") Integer answerId);

    void decreAnswerDownVoteOnly(@Param("answerId") Integer answerId);


    void voteAnswer(@Param("userId") String userId, @Param("answerId") Integer answerId, @Param("whichVote") Integer whichVote, @Param("createTime") Timestamp createTime);

    void insertVoteAnswer(@Param("userId") String userId, @Param("answerId") Integer answerId, @Param("whichVote") Integer whichVote, @Param("createTime") Timestamp createTime);

    Integer userVoteExisted(@Param("answerId") Integer answerId, @Param("userId") String userId);

    Integer getUserVoteStatus(@Param("answerId") Integer answerId, @Param("userId") String userId);

    Integer isCollectAnswer(@Param("answerId") Integer answerId, @Param("userId") String userId);

    Integer cancelCollectAnswer(@Param("userId") String userId, @Param("answerId") Integer answerId);

    Integer collectAnswer(@Param("userId") String userId, @Param("answerId") Integer answerId, @Param("createTime") Timestamp createTime);

    Integer getQuestionIdByAnswerId(@Param("answerId") Integer answerId);

    String getUserIdByAnswerId(@Param("answerId") Integer answerId);
}
