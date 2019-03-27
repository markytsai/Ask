package com.ilsxh.dao;


import com.ilsxh.entity.Day;
import com.ilsxh.entity.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NotificateDao {


    /** read message from message_sys
     * @param userId
     * @param nearDay
     * @param farDay
     * @return
     */
    List<Message> getPeriodSysNotifications(@Param("userId") String userId, @Param("nearDay") Integer nearDay, @Param("farDay") Integer farDay);


    /** read message from message_user
     * @param userId
     * @param nearDay
     * @param farDay
     * @return
     */
    List<Message> getPeriodUserNotifications(@Param("userId") String userId, @Param("nearDay") Integer nearDay, @Param("farDay") Integer farDay);
}
