package com.ilsxh.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * @author Tsaizhenya
 */
@Component
public class TaskJob {

//    @Scheduled(cron = "0/5 * *  * * ? ")
    public void job1() {
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(sdf.format(new Timestamp(System.currentTimeMillis()).getTime()) + "*********B任务每5秒执行一次进入测试");
    }
}
