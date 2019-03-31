package com.ilsxh.service;

import com.ilsxh.dao.NotificateDao;
import com.ilsxh.entity.Day;
import com.ilsxh.entity.Message;
import com.ilsxh.enums.StatusEnum;
import com.ilsxh.exception.CustomException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author Tsaizhenya
 */
@Service
public class NotificateService {

    @Autowired
    private NotificateDao notificateDao;

    private Date beforeday(int day) {
        final Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -day);
        return cal.getTime();
    }

    /**
     * @param userId
     * @param periodDaysNo 以dateGap作为一次查询的间隔
     * @param tableType    查询类型，从message_sys：1  message_user 2
     * @param type         查询结果类型：消息类型，默认为0，表示所有类型的消息；1. 问题 2.回答  3.评论 4.关注 5.点赞
     * @return
     */
    public List<Day> getNotifications(String userId, int periodDaysNo, int tableType, Integer type) {

        // 以5天作为一次查询
        int dateGap = 2;
        List<Day> retList = new ArrayList<>();
        for (int i = periodDaysNo * dateGap; i < dateGap + periodDaysNo * dateGap; i++) {
            List<Message> tmpList;
            if (tableType == 1) {
                tmpList = notificateDao.getPeriodSysNotifications(userId, i, i + 1, type);
            } else {
                tmpList = notificateDao.getPeriodUserNotifications(userId, i, i + 1, type);
            }
            Date beforeDay = beforeday(i);
            Day day = new Day();
            day.setDate(new Timestamp(beforeDay.getTime()));
            day.setMessageList(tmpList);
            day.setTotalCountInDay(tmpList.size());
            retList.add(day);
        }
        return retList;
    }

    public int getTotalMessagNum(String userId, Integer mode, int type) {
        return notificateDao.getTotalMessagNum(userId, mode, type);
    }

    public List<Day> getNotificationsCard(String userId, Integer periodDaysNo, String type) {
        String[] types = type.split("-");
        List<Integer> typeList = new ArrayList<>();
        List<Integer> toUpdateMessageIds = new ArrayList<>();

        for (String s : types) {
            typeList.add(Integer.valueOf(s));
        }

        // 以5天作为一次查询
        int dateGap = 2;
        List<Day> retList = new ArrayList<>();
        for (int i = periodDaysNo * dateGap; i < dateGap + periodDaysNo * dateGap; i++) {
            List<Message> tmpList = notificateDao.getPeriodUserNotificationsCard(userId, i, i + 1, typeList);
            Date beforeDay = beforeday(i);
            Day day = new Day();
            day.setDate(new Timestamp(beforeDay.getTime()));
            day.setMessageList(tmpList);
            day.setTotalCountInDay(tmpList.size());
            retList.add(day);
            day.getMessageList().stream().forEach(x -> toUpdateMessageIds.add(x.getMesssageId()));
        }
        if (toUpdateMessageIds.size() > 0) {
            Integer updateNum = notificateDao.updateMessageStatusToAlreadyRead(toUpdateMessageIds);
            if (updateNum.intValue() != toUpdateMessageIds.size()) {
                throw new CustomException(StatusEnum.FAIL, "更新消息状态异常");
            }
        }
        return retList;
    }

    public void insertMessage(Message message) {
        notificateDao.insertMessage(message);
    }
}
