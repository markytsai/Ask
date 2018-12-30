package com.ilsxh.dao;

import com.ilsxh.entity.Question;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/ApplicationContext.xml"})
public class QuestionDaoTest {

    @Autowired
    private QuestionDao questionDao;

    @Test
    public void getFollowingQuestionList() {


    }

}