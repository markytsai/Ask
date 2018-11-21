package com.ilsxh.dao;

import com.ilsxh.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/ApplicationContext.xml"})
public class IUserDaoTest {

    @Autowired
    private IUserDao userDao;

    @Test
    public void testSelectUser() throws Exception {
        long id = 1;
        User user = userDao.selectUser(id);
        System.out.println(user.getUsername());
    }

}