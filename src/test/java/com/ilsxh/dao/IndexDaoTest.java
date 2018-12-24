package com.ilsxh.dao;

import com.ilsxh.BaseTest;
import com.ilsxh.entity.Activity;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


public class IndexDaoTest extends BaseTest {

    @Autowired
    private IndexDao indexDao;

    @Test
    public void getActivity() {
        String userId = "45e6c1985fe640e09cd770d95e6e2c8b";
        List<Activity> activityList = indexDao.getVotedAnswer(userId);
        activityList.stream().forEach(a -> a.setActivityStaus(3));
        int a = 0;
    }

}