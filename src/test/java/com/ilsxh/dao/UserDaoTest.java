package com.ilsxh.dao;

import com.ilsxh.entity.User;
import com.ilsxh.util.MyUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/ApplicationContext.xml"})
public class UserDaoTest {

    @Autowired
    private UserDao userDao;

    @Test
    public void test() {
        User user = userDao.selectUserByUserId(1);

        System.out.println(user.getUsername());

    }

    @Test
    public void getCode() {
        System.out.println(MyUtil.createRandomCode());
    }


}