package com.ilsxh.dao;

import com.ilsxh.entity.LogMessage;
import org.apache.ibatis.annotations.Param;

public interface LogDao {

    Integer insertLog(@Param("log") LogMessage log);
}
