package com.ilsxh.service;

import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;


@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private JedisPool jedisPool;

    public static final long EXPIRE_TIME = 60 * 60 * 24;

    /**
     * 用户登陆
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

        String loginToken = "1997";
        Cookie cookie = new Cookie("loginToken", loginToken);
        cookie.setPath("/");
        // 过期时间设置为一天
        cookie.setMaxAge(60 * 60 * 24);
        response.addCookie(cookie);

        Jedis jedis = jedisPool.getResource();
        jedis.set(loginToken, userId.toString(), "nx", "ex", EXPIRE_TIME);
        jedis.close();

        User loginUser = userDao.selectUserByUserId(userId);
        loginUserMap.put("loginUserInfo", loginUser);

        return loginUserMap;
    }
}