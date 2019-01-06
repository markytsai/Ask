package com.ilsxh.service;

import com.ilsxh.dao.AnswerDao;
import com.ilsxh.dao.QuestionDao;
import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import com.ilsxh.util.Response;
import com.ilsxh.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private AnswerDao answerDao;

    @Autowired
    private QuestionDao questionDao;

    @Autowired
    private JedisPool jedisPool;

    /**
     * expire time is one single day
     */
    public static final int EXPIRE_TIME = 60 * 60 * 24 * 3;

    public static final String COOKIE_NAME_TOKEN = "currentUser";

    /**
     * 用户登陆
     *
     * @param email
     * @param password
     * @param response
     * @return
     */
    public Map<String, Object> login(String email, String password, Boolean rememberMe, HttpServletResponse response) {
        Map<String, Object> loginUserMap = new HashMap<>();

        String userId = userDao.selectUserIdByEmailAndPassword(email, password);
        if (userId == null) {
            loginUserMap.put("loginError", "用户名或密码错误");
            return loginUserMap;
        }

        autoGenCookie(response, userId, rememberMe);
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
                // 从Redis缓存中清除loginToken
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


    private void autoGenCookie(HttpServletResponse response, String userId, Boolean rememberMe) {
        // generate cookies to backward browsers
        String loginToken = UUIDUtil.uuid();
        Cookie cookie = new Cookie(COOKIE_NAME_TOKEN, loginToken);
        cookie.setPath("/");
        if (rememberMe) {
            // 过期时间设置为一天
            cookie.setMaxAge(EXPIRE_TIME);
        }
        response.addCookie(cookie);

        Jedis jedis = jedisPool.getResource();
        jedis.set(loginToken, userId.toString(), "nx", "ex", EXPIRE_TIME);
        jedis.close();
    }

    /**
     * 根据cookie值来获取用户唯一ID
     *
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
     *
     * @param userId
     * @param localUserId
     * @return
     */
    public Map<String, Object> getUserProfile(String userId, String localUserId) {
        Map<String, Object> map = new HashMap<>();
        // 登录用户
        User loginUser = userDao.selectUserByUserId(localUserId);
        User homeUser = null;
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
        return map;
    }

    public Integer selectUserByUserIdWithFollowingStatus(String userId,String localUserId) {
        return userDao.selectUserByUserIdWithFollowingStatus(userId, localUserId);
    }

    public User getUserByUserId(String userId) {
        return userDao.selectUserByUserId(userId);
    }

    public Question getQuestionById(Integer questionId) {
        return userDao.selectQuestionByQuestionId(questionId);
    }

    public List<Answer> getAnswersByUserId(String userId) {

        List<Answer> answerList = userDao.getAnswersByUserId(userId);

        for (Answer answer : answerList) {
            Question question = questionDao.selectQuestionByQuestionId(answer.getQuestionId());
            User user = getUserByUserId(answer.getAnswerUserId());
            answer.setQuestion(question);

            // 获取登录用户和被查看直接的收藏，点赞关系
            Integer upOrDownVote = answerDao.getUserVoteStatus(answer.getAnswerId(), userId);
            Integer isCollectAnswer = answerDao.isCollectAnswer(answer.getAnswerId(), userId);
            // 获取答主关注状态，是否被关注
            Integer userFollowStatus = userDao.getUserFollowStatus(userId, answer.getAnswerUserId());
            if (userFollowStatus == null) {
                user.setFollowStatus(0);
            } else {
                user.setFollowStatus(userFollowStatus);
            }
            if (upOrDownVote != null) {
                user.setVote(upOrDownVote);
            } else {
                user.setVote(0);
            }
            if (isCollectAnswer != null && isCollectAnswer == 1) {
                answer.setCollectAnswer(Boolean.TRUE);
            } else {
                answer.setCollectAnswer(Boolean.FALSE);
            }

            answer.setUser(user);
        }
        return answerList;
    }



    public void followUser(String userId, String userIdToBeFollowed, Long createTime) {

        Integer followExisted = userDao.getUserFollowStatus(userId, userIdToBeFollowed);
        if (followExisted == null) { // 第一次关注答主
            userDao.insertUserFollowStatus(userId, userIdToBeFollowed, 1, createTime);
        } else if (followExisted == 0) { // 曾经关注过，再次关注操作
            userDao.updateUserFollowStatus(userId, userIdToBeFollowed, 1, createTime);
        } else { // 取关操作
            userDao.updateUserFollowStatus(userId, userIdToBeFollowed, 0,createTime);
        }

    }

    public List<User> getollowingUserByUserId(String userId) {
        return userDao.getollowingUserByUserId(userId);
    }
}