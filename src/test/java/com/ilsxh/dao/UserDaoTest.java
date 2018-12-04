package com.ilsxh.dao;

import com.ilsxh.BaseTest;
import com.ilsxh.entity.User;
import com.ilsxh.util.MyUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UserDaoTest extends BaseTest{

    @Autowired
    private UserDao userDao;

    @Test
    public void test() {
        User user = userDao.selectUserByUserId("1");

        System.out.println(user.getUsername());

    }

    @Test
    public void getCode() {
        System.out.println(MyUtil.createRandomCode());
    }


}