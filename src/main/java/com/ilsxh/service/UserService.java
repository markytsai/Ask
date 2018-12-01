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

        Integer userId = userDao.selectUserIdByEmailAndPassword(email, password);
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

        Integer userId = userDao.regiterNewUser(email, username, password);
        if (userId == null) {
            registerUserMap.put("errorInfo", "用户名或密码错误");
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


    private void autoGenCookie(HttpServletResponse response, Integer userId) {
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
}