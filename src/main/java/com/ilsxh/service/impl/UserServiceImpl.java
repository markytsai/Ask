package com.ilsxh.service.impl;

import com.ilsxh.dao.IUserDao;
import com.ilsxh.entity.User;
import com.ilsxh.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    public User selectUser(long userId) {
        return this.userDao.selectUser(userId);
    }

}