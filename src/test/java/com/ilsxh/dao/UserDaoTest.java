package com.ilsxh.dao;

import com.google.gson.Gson;
import com.ilsxh.BaseTest;
import com.ilsxh.entity.User;
import com.ilsxh.util.MyConstant;
import com.ilsxh.util.MyUtil;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.util.Date;

public class UserDaoTest extends BaseTest {

    @Autowired
    private UserDao userDao;

    @Autowired
    private IndexDao indexDao;

    @Test
    public void test() {
        User user = userDao.selectUserByUserId("1");

        System.out.println(user.getUsername());

    }

    @Test
    public void getCode() {
        System.out.println(MyUtil.createRandomCode());
    }

    @Test
    public void getUser() {
        Integer ret = indexDao.selectUserCountByUserIdAndPassword("8a829463a9cc47a787dd179c3f23fa66", "123");
        User user = indexDao.selectProfileInfoByUserId("8a829463a9cc47a787dd179c3f23fa66");
        System.out.println(user.getUsername());
    }

    @Test
    public void uploadFile() throws Exception {

        byte[] bytes = new byte[10];
        for (int i = 0; i < 10; i++) {
            bytes[i] = 1;
        }

        MyUtil.saveToLocal(bytes, "images/userAvatar/" + "8a829463a9cc47a787dd179c3f23fa66" + ".jpg");
    }

    @Test
    public void getTime() {
        Date now = new Date();
        System.out.println(now);
        System.out.println(now.getTime());
    }
}