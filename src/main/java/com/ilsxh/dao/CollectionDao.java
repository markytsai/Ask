package com.ilsxh.dao;

import com.ilsxh.entity.Answer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CollectionDao {

    List<Answer> getAnswerCollectionByUserId(@Param("userId") String userId, @Param("offset") Integer offset, @Param("limit") Integer limit);

    Integer getTotalCollectionNum(@Param("userId") String userId);
}
