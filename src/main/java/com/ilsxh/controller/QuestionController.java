package com.ilsxh.controller;

import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping
public class QuestionController {

    @RequestMapping("/focus")
    public String getQuestionList(Model model) {

        List<Question> questionList = new ArrayList<>();

        String questionContext = "我差不多是在阿里云实习的时候，写的第一行Java代码（至少是第一个pom.xml），大概总共实习了三个月时间，" +
                "在JStorm上面完成了一个比较简单的日志分析应用，其实很无聊，就是从Kafka把数据接到JStorm里面，做一些数据的过滤、关键信息的抽取、" +
                "一个时间窗口上的聚合，最后把数据写入到MySQL。其实这些数据最后主要是运维拿过去做一些报警，或者其它的一些分析。";
        Question q1 = new Question();
        q1.setQuestionId(1);
        q1.setQuestionTitle("淘宝店真的那么可怕么");
        q1.setQuestionContent(questionContext);
//        q1.setCreateTime(new SimpleDateFormat("yyyy-mm-dd", new Date()));
        q1.setFollowedCount(1000);

        q1.setAnswerCount(1000);
        User user = new User();
        user.setUserId(1);
        user.setUsername("caizhenya");
        q1.setUserId(1);
        q1.setUser(user);
        questionList.add(q1);


        String questionContext1 = "我差不多是在阿里云实习的时候，写的第一行Java代码（至少是第一个pom.xml），大概总共实习了三个月时间，" +
                "在JStorm上面完成了一个比较简单的日志分析应用，其实很无聊，就是从Kafka把数据接到JStorm里面，做一些数据的过滤、关键信息的抽取、" +
                "一个时间窗口上的聚合，最后把数据写入到MySQL。其实这些数据最后主要是运维拿过去做一些报警，或者其它的一些分析。";
        Question q2 = new Question();
        q2.setQuestionId(1);
        q2.setQuestionTitle("淘宝店真的那么可怕么");
        q2.setQuestionContent(questionContext);
//        q1.setCreateTime(new SimpleDateFormat("yyyy-mm-dd", new Date()));
        q2.setFollowedCount(1000);

        q2.setAnswerCount(1000);
        User user1 = new User();
        user1.setUserId(1);
        user1.setUsername("caizhenya");
        q2.setUserId(1);
        q2.setUser(user);
        questionList.add(q2);


        String questionContext3 = "我差不多是在阿里云实习的时候，写的第一行Java代码（至少是第一个pom.xml），大概总共实习了三个月时间，" +
                "在JStorm上面完成了一个比较简单的日志分析应用，其实很无聊，就是从Kafka把数据接到JStorm里面，做一些数据的过滤、关键信息的抽取、" +
                "一个时间窗口上的聚合，最后把数据写入到MySQL。其实这些数据最后主要是运维拿过去做一些报警，或者其它的一些分析。";
        Question q3 = new Question();
        q3.setQuestionId(1);
        q3.setQuestionTitle("淘宝店真的那么可怕么");
        q3.setQuestionContent(questionContext);
//        q1.setCreateTime(new SimpleDateFormat("yyyy-mm-dd", new Date()));
        q3.setFollowedCount(1000);

        q3.setAnswerCount(1000);
        User user3 = new User();
        user3.setUserId(1);
        user3.setUsername("caizhenya");
        q3.setUserId(1);
        q3.setUser(user);
        questionList.add(q3);


        String questionContext4 = "我差不多是在阿里云实习的时候，写的第一行Java代码（至少是第一个pom.xml），大概总共实习了三个月时间，" +
                "在JStorm上面完成了一个比较简单的日志分析应用，其实很无聊，就是从Kafka把数据接到JStorm里面，做一些数据的过滤、关键信息的抽取、" +
                "一个时间窗口上的聚合，最后把数据写入到MySQL。其实这些数据最后主要是运维拿过去做一些报警，或者其它的一些分析。";
        Question q4 = new Question();
        q4.setQuestionId(1);
        q4.setQuestionTitle("淘宝店真的那么可怕么");
        q4.setQuestionContent(questionContext);
//        q1.setCreateTime(new SimpleDateFormat("yyyy-mm-dd", new Date()));
        q4.setFollowedCount(1000);

        q4.setAnswerCount(1000);
        User user4 = new User();
        user4.setUserId(1);
        user4.setUsername("caizhenya");
        q4.setUserId(1);
        q4.setUser(user);
        questionList.add(q4);


        String questionContext5 = "我差不多是在阿里云实习的时候，写的第一行Java代码（至少是第一个pom.xml），大概总共实习了三个月时间，" +
                "在JStorm上面完成了一个比较简单的日志分析应用，其实很无聊，就是从Kafka把数据接到JStorm里面，做一些数据的过滤、关键信息的抽取、" +
                "一个时间窗口上的聚合，最后把数据写入到MySQL。其实这些数据最后主要是运维拿过去做一些报警，或者其它的一些分析。";
        Question q5 = new Question();
        q5.setQuestionId(1);
        q5.setQuestionTitle("淘宝店真的那么可怕么");
        q5.setQuestionContent(questionContext);
//        q1.setCreateTime(new SimpleDateFormat("yyyy-mm-dd", new Date()));
        q5.setFollowedCount(1000);

        q5.setAnswerCount(1000);
        User user5 = new User();
        user5.setUserId(1);
        user5.setUsername("caizhenya");
        q5.setUserId(1);
        q5.setUser(user);
        questionList.add(q5);

        model.addAttribute("questionList", questionList);

        return "index";
    }
}



