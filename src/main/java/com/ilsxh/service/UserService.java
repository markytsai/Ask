package com.ilsxh.service;

import com.ilsxh.annotation.OperAnnotation;
import com.ilsxh.enums.StatusEnum;
import com.ilsxh.dao.AnswerDao;
import com.ilsxh.dao.QuestionDao;
import com.ilsxh.dao.UserDao;
import com.ilsxh.entity.Answer;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import com.ilsxh.exception.CustomException;
import com.ilsxh.redis.UserKey;
import com.ilsxh.response.BaseResponse;
import com.ilsxh.util.Page;
import com.ilsxh.util.UUIDUtil;
import com.ilsxh.vo.FirstLoginVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ilsxh.enums.StatusEnum.CONTINUE_LOGIN;
import static com.ilsxh.enums.StatusEnum.FIRST_LOGIN;
import static com.ilsxh.util.MyConstant.FIRST_LOGIN_STATUS;

@Service
public class UserService {

    private UserDao userDao;
    private AnswerDao answerDao;
    private QuestionDao questionDao;
    private RedisService redisService;

    @Autowired
    public UserService(UserDao userDao, AnswerDao answerDao, QuestionDao questionDao, RedisService redisService) {
        this.userDao = userDao;
        this.answerDao = answerDao;
        this.questionDao = questionDao;
        this.redisService = redisService;
    }

    /**
     * expire time is one single day
     */
    public static final int EXPIRE_TIME = 60 * 60 * 24 * 3;

    public static final String COOKIE_TOKEN_NAME = "currentUser";

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

        FirstLoginVo user = userDao.selectUserIdByEmailAndPassword(email, password);
        if (user == null || user.getUserId() == null) {
            throw new CustomException(StatusEnum.LOGIN_ERROR);
        }

        // 用户首次登录，更新状态码
        if (user.getFirstLogin().equals(FIRST_LOGIN.getCode())) {
            loginUserMap.put(FIRST_LOGIN_STATUS, StatusEnum.FIRST_LOGIN.getCode());
            userDao.updateFirstLoginStatus(user.getUserId(), CONTINUE_LOGIN.getCode());
        } else {
            loginUserMap.put(FIRST_LOGIN_STATUS, StatusEnum.CONTINUE_LOGIN.getCode());
        }

        autoGenCookie(response, user.getUserId(), rememberMe);
        User loginUser = userDao.selectUserByUserId(user.getUserId());
        loginUserMap.put("loginUserInfo", loginUser);

        return loginUserMap;
    }

    public Map<String, Object> registerNewUser(String email, String username, String password, HttpServletResponse response) {
        Map<String, Object> registerUserMap = new HashMap<>();

        String userId = UUIDUtil.uuid();
        Integer effectRow = userDao.regiterNewUser(userId, email, username, password, new Timestamp(System.currentTimeMillis()));
        if (effectRow == null) {
            registerUserMap.put("loginError", "用户名或密码错误");
        }
        User user = userDao.selectUserByUserId(userId);
        return registerUserMap;
    }

    public boolean logout(HttpServletRequest request, HttpServletResponse response) {
        String loginToken = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(COOKIE_TOKEN_NAME)) {
                loginToken = cookie.getValue();
                if (redisService.delete(UserKey.loginUserKey, loginToken)) {
                    System.out.println("token刪除成功");
                }
                break;
            }
        }

        Cookie cookie = new Cookie(COOKIE_TOKEN_NAME, "");
        cookie.setPath("/");
        // 清除浏览器端的cookie
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        // 清除 缓存中的cookie
        boolean delSuceess = redisService.delete(UserKey.loginUserKey, loginToken);

        return delSuceess;
    }


    private void autoGenCookie(HttpServletResponse response, String userId, Boolean rememberMe) {
        // 每次登录生成一个随机码，存到缓存中去
        String loginToken = UUIDUtil.uuid();
        Cookie cookie = new Cookie(COOKIE_TOKEN_NAME, loginToken);
        cookie.setPath("/");
        if (rememberMe) {
            // 过期时间设置为一天
            cookie.setMaxAge(EXPIRE_TIME);
        }
        response.addCookie(cookie);

        redisService.set(UserKey.loginUserKey, loginToken, userId);
    }

    public Map<String, Object> getUserDetailWithLoginUser(String userId, String localUserId) {
        Map<String, Object> map = new HashMap<>();
        User user = this.getUserByUserId(userId);

        Integer isExistFollowStatus = selectUserByUserIdWithFollowingStatus(userId, localUserId);
        user.setFollowStatus(isExistFollowStatus == null ? 0 : isExistFollowStatus);

        map.put("user", user);
        map.put("localUserId", localUserId);

        return map;
    }

    public Integer selectUserByUserIdWithFollowingStatus(String userId, String localUserId) {
        return userDao.selectUserByUserIdWithFollowingStatus(userId, localUserId);
    }

    public User getUserByUserId(String userId) {
        return userDao.selectUserByUserId(userId);
    }

    public Question getQuestionById(Integer questionId) {
        return userDao.selectQuestionByQuestionId(questionId);
    }

    public Page<Answer> getAnswersByUserId(String userId, Integer pageNo) {

        int pageSize = 20;
        List<Answer> answerList = userDao.getAnswersByUserId(userId, (pageNo - 1) * pageSize, pageSize);
        int answerTotal = userDao.getTotalAnswerByUserId(userId);

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
        return new Page<>(pageNo, pageSize, answerTotal, answerList);
    }


    public BaseResponse followUser(String userId, String userIdToBeFollowed, Timestamp createTime) {

        Integer effectRow = 0;
        Integer followExisted = userDao.getUserFollowStatus(userId, userIdToBeFollowed);
        if (followExisted == null) { // 第一次关注答主
            effectRow = userDao.insertUserFollowStatus(userId, userIdToBeFollowed, 1, createTime);
            return new BaseResponse(effectRow == 1 ? StatusEnum.SUCCESS.getCode() : StatusEnum.FAIL.getCode(), "成功关注用户", "");
        } else if (followExisted == 0) { // 曾经关注过，再次关注操作
            effectRow = userDao.updateUserFollowStatus(userId, userIdToBeFollowed, 1, createTime);
            return new BaseResponse(effectRow == 1 ? StatusEnum.SUCCESS.getCode() : StatusEnum.FAIL.getCode(), "成功关注用户", "");
        } else { // 取关操作
            effectRow = userDao.updateUserFollowStatus(userId, userIdToBeFollowed, 0, createTime);
            return new BaseResponse(effectRow == 1 ? StatusEnum.SUCCESS.getCode() : StatusEnum.FAIL.getCode(), "取消关注用户", "");
        }

    }

    public Page<User> getollowingUserByUserId(String userId, Integer pageNo) {
        int pageSize = 30;

        int totalFollowingUserNum = userDao.getTotalFollowingUserNum(userId);

        List<User> userList = userDao.getollowingUserByUserId(userId, (pageNo - 1) * pageSize, pageSize);

        return new Page<User>(pageSize, pageNo, totalFollowingUserNum, userList);
    }

    public Integer updateUsernameByUserId(String userId, String newContent) {
        return userDao.updateUsernameByUserId(userId, newContent);
    }

    public Integer updateUserGenderByUserId(String userId, String newContent) {
        if ("女".equals(newContent)) {
            return userDao.updateUserGenderByUserId(userId, 1);
        } else {
            return userDao.updateUserGenderByUserId(userId, 2);
        }
    }

    public Integer updateUserEmailByUserId(String userId, String newContent) {
        return userDao.updateUserEmailByUserId(userId, newContent);
    }

    public Integer updateUserIndustryByUserId(String userId, String newContent) {
        return userDao.updateUserIndustryByUserId(userId, newContent);
    }

    public Integer updateUserPositionByUserId(String userId, String newContent) {
        return userDao.updateUserPositionByUserId(userId, newContent);
    }

    public Integer updateUserSimpleDescByUserId(String userId, String newContent) {
        return userDao.updateUserSimpleDescByUserId(userId, newContent);
    }

    public Integer updateUserFullDescByUserId(String userId, String newContent) {
        return userDao.updateUserFullDescByUserId(userId, newContent);
    }
}