package com.ilsxh.dao;

import com.ilsxh.entity.Log;
import org.apache.ibatis.annotations.Param;

public interface LogDao {

    Integer insertLog(@Param("log") Log log);
}
