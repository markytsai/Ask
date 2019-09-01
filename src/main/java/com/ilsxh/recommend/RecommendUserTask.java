package com.ilsxh.recommend;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;


@Component
public class RecommendUserTask {

    String pattern="yyyy/MM/dd HH时mm分ss秒";
    SimpleDateFormat sdf= new SimpleDateFormat(pattern);

//    @Scheduled(cron="0 * * * * ?")
    public void test() {
        Date date= new Date(System.currentTimeMillis());

        String datestr=sdf.format(date);
        System.out.println(datestr);
    }
}
