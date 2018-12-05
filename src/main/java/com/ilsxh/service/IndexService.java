package com.ilsxh.service;

import com.ilsxh.dao.IndexDao;
import com.ilsxh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class IndexService {

    @Autowired
    private IndexDao indexDao;

    public User getProfileInfo(String userId) {

        User user = indexDao.selectProfileInfoByUserId(userId);

        return user;
    }

    public void updateProfile(User user) {
        indexDao.updateProfile(user);
    }

    public Map<String, String> updatePassword(String userId, String password, String newpassword) {

        Map<String, String> map = new HashMap<>();
        Integer userCount = indexDao.selectUserCountByUserIdAndPassword(userId, password);
        if (userCount == null) {
            map.put("error", "原密码不正确");
            return map;
        }
        indexDao.updatePassword(userId, newpassword);
        return map;
    }

    public void updateAvatarUrl(String userId, String avatarUrl) {
        indexDao.updateAvatarUrl(userId, avatarUrl);
    }
}
