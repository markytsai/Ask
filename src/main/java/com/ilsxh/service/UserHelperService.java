package com.ilsxh.service;

import com.ilsxh.dao.NotificateDao;
import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.User;
import com.ilsxh.redis.UserKey;
import com.ilsxh.util.MyConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ilsxh.service.UserService.COOKIE_TOKEN_NAME;

/**
 * @author Tsaizhenya
 */
@Service
public class UserHelperService {

    private RedisService redisService;
    private UserDao userDao;
    private NotificateDao notificateDao;

    @Autowired
    public UserHelperService(RedisService redisService, UserDao userDao, NotificateDao notificateDao) {
        this.redisService = redisService;
        this.userDao = userDao;
        this.notificateDao = notificateDao;
    }

    /**
     * 从缓存中获取登录用户信息
     *
     * @param request
     * @return
     */
    public String getUserIdFromRedis(HttpServletRequest request) {
        String loginToken = null;
        String userId = MyConstant.TOURIST_USERID;
        Cookie[] cookies = request.getCookies();
        if (null == cookies || cookies.length <= 0) {
            return userId;
        }
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(COOKIE_TOKEN_NAME)) {
                loginToken = cookie.getValue();
                break;
            }
        }

        userId = redisService.get(UserKey.loginUserKey, loginToken, String.class);

        return userId;
    }


    /**
     * 根据传来的参数和token里面的userId，判断是不是登录用户
     *
     * @param userId
     * @param localUserId
     * @return
     */
    public Map<String, Object> getUserProfile(String userId, String localUserId) {
        Map<String, Object> map = new HashMap<>();
        // 登录用户
        User loginUser = userDao.selectUserByUserId(localUserId);
        User homeUser;
        homeUser = userDao.selectUserByUserId(userId);

        if (userId.equals(localUserId)) {
            // 即将被访问主页的用户
            map.put("isLoginUser", "true");
        } else {
            map.put("isLoginUser", "false");
            Integer isExistFollowStatus = selectUserByUserIdWithFollowingStatus(userId, localUserId);
            if (isExistFollowStatus == null) {
                homeUser.setFollowStatus(0);
            } else {
                homeUser.setFollowStatus(isExistFollowStatus);
            }
        }

        map.put("user", loginUser);
        map.put("homeUser", homeUser);
        map.put("unreadMessageCount", notificateDao.getUnreadMessageCount(localUserId));
        return map;
    }

    /**
     * 获取用户之间的关注情况
     *
     * @param userId
     * @param localUserId
     * @return
     */
    public Integer selectUserByUserIdWithFollowingStatus(String userId, String localUserId) {
        return userDao.selectUserByUserIdWithFollowingStatus(userId, localUserId);
    }

    /**
     * 获取用户信息
     *
     * @param userId
     * @return
     */
    public User getUserByUserId(String userId) {
        return userDao.selectUserByUserId(userId);
    }

    /**
     * 获取用户的粉丝列表
     *
     * @param userId
     * @return
     */
    public List<User> getollowingUserByUserId(String userId, int pageNo) {
        int pageSize = 30;
        return userDao.getollowingUserByUserId(userId, (pageNo - 1) * pageSize, pageSize);
    }

    /**
     * 公共数据
     *
     * @param userId
     * @param model
     * @return
     */
    public Model getUserDetails(String userId, Model model) {

        User user = this.getUserByUserId(userId);
        model.addAttribute("user", user);
        if (null == user) {
            model.addAttribute("username", "游客登录");
        } else {
            model.addAttribute("username", user.getUsername());
        }

        // 这里获取消息未读个数
        Integer unreadMessageCount = notificateDao.getUnreadMessageCount(userId);
        model.addAttribute("unreadMessageCount", unreadMessageCount);
        return model;
    }

    public String selectUsernameByUserId(String userId) {
        return userDao.selectUsernameByUserId(userId);
    }

    /**
     * 获取用户与目标用户的关注情况：已关注-未关注
     *
     * @param userId
     * @param answerUserId
     * @return
     */
    public Integer getUserFollowStatus(String userId, String answerUserId) {
        return userDao.getUserFollowStatus(userId, answerUserId);
    }

}
