package com.ilsxh.service;

import com.ilsxh.dao.NotificateDao;
import com.ilsxh.entity.Day;
import com.ilsxh.entity.Message;
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
     *
     * @param userId
     * @param periodDaysNo 以dateGap作为一次查询的间隔
     * @param notiType 查询类型，从message_sys：1  message_user 2
     * @return
     */
    public List<Day> getNotifications(String userId, int periodDaysNo, int notiType) {
        // 以5天作为一次查询
        int dateGap = 2;
        List<Day> retList = new ArrayList<>();
        for (int i = periodDaysNo * dateGap; i < dateGap + periodDaysNo * dateGap; i++) {
            List<Message> tmpList;
            if (notiType == 1) {
                tmpList = notificateDao.getPeriodSysNotifications(userId, i, i + 1);
            } else {
                tmpList = notificateDao.getPeriodUserNotifications(userId, i, i + 1);
            }
            Date beforeDay = beforeday(i);
            Day day = new Day();
            day.setDate(new Timestamp(beforeDay.getTime()));
            day.setMessageList(tmpList);
            retList.add(day);
        }
        return retList;
    }
}
