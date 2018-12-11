package com.ilsxh.service;

import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.User;
import com.ilsxh.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private JedisPool jedisPool;

    /**
     * expire time is one single day
     */
    public static final int EXPIRE_TIME = 60 * 60 * 24;

    public static final String COOKIE_NAME_TOKEN = "currentUser";

    /**
     * 用户登陆
     *
     * @param email
     * @param password
     * @param response
     * @return
     */
    public Map<String, Object> login(String email, String password, HttpServletResponse response) {
        Map<String, Object> loginUserMap = new HashMap<>();

        String userId = userDao.selectUserIdByEmailAndPassword(email, password);
        if (userId == null) {
            loginUserMap.put("loginError", "用户名或密码错误");
            return loginUserMap;
        }

        this.autoGenCookie(response, userId);
        User loginUser = userDao.selectUserByUserId(userId);
        loginUserMap.put("loginUserInfo", loginUser);

        return loginUserMap;
    }

    public Map<String, Object> registerNewUser(String email, String username, String password, HttpServletResponse response) {
        Map<String, Object> registerUserMap = new HashMap<>();

        String userId = UUIDUtil.uuid();
        Integer effectRow = userDao.regiterNewUser(userId, email, username, password);
        if (effectRow == null) {
            registerUserMap.put("loginError", "用户名或密码错误");
        }
        User user = userDao.selectUserByUserId(userId);
//        addCookie(user, response);
        return registerUserMap;
    }

    public String logout(HttpServletRequest request, HttpServletResponse response) {
        String loginToken = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(COOKIE_NAME_TOKEN)) {
                loginToken = cookie.getValue();
                // 从缓存中清除loginToken
                Jedis jedis = jedisPool.getResource();
                jedis.del(loginToken);
                jedis.close();
                break;
            }
        }

        Cookie cookie = new Cookie(COOKIE_NAME_TOKEN, "");
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        return loginToken;
    }


    private void autoGenCookie(HttpServletResponse response, String userId) {
        // generate cookies to backward browsers
        String loginToken = UUIDUtil.uuid();
        Cookie cookie = new Cookie(COOKIE_NAME_TOKEN, loginToken);
        cookie.setPath("/");
        // 过期时间设置为一天
        cookie.setMaxAge(EXPIRE_TIME);
        response.addCookie(cookie);

        Jedis jedis = jedisPool.getResource();
        jedis.set(loginToken, userId.toString(), "nx", "ex", EXPIRE_TIME);
        jedis.close();
    }

    /**
     * 根据cookie值来获取用户唯一ID
     * @param request
     * @return
     */
    public String getUserIdFromRedis(HttpServletRequest request) {
        String loginToken = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(COOKIE_NAME_TOKEN)) {
                loginToken = cookie.getValue();
                break;
            }
        }

        Jedis jedis = jedisPool.getResource();
        String userId = jedis.get(loginToken);
        jedis.close();

        return userId;
    }

    /**
     * 根据传来的参数和token里面的userId，判断是不是登录用户
     * @param userId
     * @param localUserId
     * @return
     */
    public Map<String, Object> getUserProfile(String userId, String localUserId) {
        Map<String, Object> map = new HashMap<>();
        User user = userDao.selectUserByUserId(userId);

        if (userId.equals(localUserId)) {
            map.put("isLoginUser", "true");
        } else {
            map.put("isLoginUser", "false");
        }

        map.put("user", user);
        return map;
    }

    public Integer followQuestion(String localUserId, String questionId) {
        return userDao.followQuestion(localUserId, questionId);
    }

    public User getUserByUserId(String userId) {
        return userDao.selectUserByUserId(userId);
    }
}