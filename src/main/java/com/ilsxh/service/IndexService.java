package com.ilsxh.service;

import com.ilsxh.dao.IndexDao;
import com.ilsxh.entity.Activity;
import com.ilsxh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class IndexService {

    private IndexDao indexDao;

    @Autowired
    public IndexService(IndexDao indexDao) {
        this.indexDao = indexDao;
    }

    /**
     * 获取用户个人信息
     * @param userId
     * @return
     */
    public User getProfileInfo(String userId) {

        User user = indexDao.selectProfileInfoByUserId(userId);

        return user;
    }

    /**
     * 更新用户资料
     * @param user
     */
    public void updateProfile(User user) {
        indexDao.updateProfile(user);
    }

    /**
     * 更新密码
     * @param userId
     * @param password
     * @param newpassword
     * @return
     */
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

    /**
     * 更新头像云端链接
     * @param userId
     * @param avatarUrl
     */
    public Integer updateAvatarUrl(String userId, String avatarUrl) {
        Integer updEffectRow = indexDao.updateAvatarUrl(userId, avatarUrl);
        return updEffectRow;
    }

    /**
     * 获取动态列表，根据用户ID
     *
     * @param userId
     * @return
     */
    public List<Activity> getActivityByUserId(String userId) {

        // 1.Voting answer
        List<Activity> resultList = indexDao.getVotedAnswer(userId);
        resultList.stream().forEach(a -> a.setActivityStaus(1));

        // 2.write answer
        List<Activity> activityAnswerList = indexDao.getAnswer(userId);
        activityAnswerList.stream().forEach(a -> a.setActivityStaus(2));
        if (activityAnswerList.size() != 0) {
            resultList.addAll(activityAnswerList);
        }

        // 3:Collect answer
        List<Activity> activityCollectionAnswerList = indexDao.getCollectionAnswer(userId);
        activityCollectionAnswerList.stream().forEach(a -> a.setActivityStaus(3));
        if (activityCollectionAnswerList.size() != 0) {
            resultList.addAll(activityCollectionAnswerList);
        }

        // 4.Following question
        List<Activity> activityFollowedQuestionList = indexDao.getFollowedQuestion(userId);
        activityFollowedQuestionList.stream().forEach(a -> a.setActivityStaus(4));
        if (activityFollowedQuestionList.size() != 0) {
            resultList.addAll(activityFollowedQuestionList);
        }

        // 5.Raised question
        List<Activity> activityRaisedQuestionList = indexDao.getRaisedQuestion(userId);
        activityRaisedQuestionList.stream().forEach(a -> a.setActivityStaus(5));
        if (activityRaisedQuestionList.size() != 0) {
            resultList.addAll(activityRaisedQuestionList);
        }

        // 6:Follow user
        List<Activity> activityFollowingUser = indexDao.getFollowingUser(userId);
        activityFollowingUser.stream().forEach(a -> a.setActivityStaus(6));
        if (activityFollowingUser.size() != 0) {
            resultList.addAll(activityFollowingUser);
        }

        resultList.sort(Comparator.comparing(Activity::getCreateTime).reversed());

        return resultList;
    }
}
