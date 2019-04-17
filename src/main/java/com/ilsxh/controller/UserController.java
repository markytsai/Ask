package com.ilsxh.controller;

import com.ilsxh.annotation.OperAnnotation;
import com.ilsxh.enums.StatusEnum;
import com.ilsxh.response.BaseResponse;
import com.ilsxh.service.UserHelperService;
import com.ilsxh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.Map;

import static com.ilsxh.util.MyConstant.FIRST_LOGIN_STATUS;

/**
 * @author Tsaizhenya
 */
@Controller
@RequestMapping
public class UserController {


    private UserService userService;
    private UserHelperService userHelperService;

    @Autowired
    public UserController(UserService userService, UserHelperService userHelperService) {
        this.userService = userService;
        this.userHelperService = userHelperService;
    }

    /**
     * 登录
     *
     * @param email
     * @param password
     * @param rememberMe
     * @param response
     * @return
     */
    @RequestMapping(value = "/toLogin")
    @ResponseBody
    public BaseResponse login(@RequestParam("email") String email, @RequestParam("password") String password,
                              @RequestParam("rememberMe") Boolean rememberMe, HttpServletResponse response) {


        Map<String, Object> userInfoMap = userService.login(email, password, rememberMe, response);

        // 首次登录，跳转到话题选择页面
        return new BaseResponse((String) userInfoMap.get(FIRST_LOGIN_STATUS), "", userInfoMap);
    }

    /**
     * 注册
     *
     * @param email
     * @param username
     * @param password
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/doRegister")
    public BaseResponse register(@RequestParam("email") String email, @RequestParam("username") String username,
                                 @RequestParam("password") String password, HttpServletResponse response) {
        Map<String, Object> userInfoMap = userService.registerNewUser(email, username, password);
        if (userInfoMap.get("errorInfo") == null) {
            return new BaseResponse(StatusEnum.REGISTER_SUCCESS.getCode(), "成功注册", userInfoMap);
        } else {
            return new BaseResponse(StatusEnum.REGISTER_FAILURE.getCode(), userInfoMap.get("errorInfo").toString());
        }
    }


    /**
     * 关注用户
     *
     * @param userIdToBeFollowed
     * @param request
     * @return
     */
    @RequestMapping("/followUser/{userIdToBeFollowed}")
    @ResponseBody
    public BaseResponse followUser(@PathVariable String userIdToBeFollowed, HttpServletRequest request) {
        String localUserId = userHelperService.getUserIdFromRedis(request);
        BaseResponse response = userService.followUser(localUserId, userIdToBeFollowed, new Timestamp(System.currentTimeMillis()));
        return response;
    }

    /**
     * 退出登录
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        String userId = userHelperService.getUserIdFromRedis(request);
        userService.logout(userId, request, response);
        return "redirect:/login";
    }

    /**
     * 游客登录，暂时不可用
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/touristLogin")
    public String touristLogin(HttpServletRequest request, HttpServletResponse response) {
        return "redirect:/recommend";
    }

    /**
     * 获取登录用户和被访问用户的关系
     *
     * @param userId
     * @param request
     * @return
     */
    @RequestMapping("/getUser/{userId}")
    @ResponseBody
    public BaseResponse getUser(@PathVariable String userId, HttpServletRequest request) {

        Map<String, Object> map = userService.getUserDetailWithLoginUser(userId, userHelperService.getUserIdFromRedis(request));
        if (map.get("user") != null) {
            return new BaseResponse(StatusEnum.SUCCESS.getCode(), "成功获取用户信息", map);
        } else {
            return new BaseResponse(StatusEnum.FAIL.getCode(), "获取用户信息失败", null);
        }
    }


    /**
     * 更新用户名
     *
     * @param newUsername
     * @param request
     * @return
     */
    @RequestMapping("/updateUsername/{newUsername}")
    @ResponseBody
    public BaseResponse updateUsername(@PathVariable String newUsername, HttpServletRequest request) {
        String userId = userHelperService.getUserIdFromRedis(request);
        Integer updateRet = userService.updateUsernameByUserId(userId, newUsername);
        if (updateRet != null && updateRet.intValue() == 1) {
            return new BaseResponse(StatusEnum.UPDATE_USERNAME_SUCCESS.getCode(), "更新用户名成功", "");
        } else {
            return new BaseResponse(StatusEnum.UPDATE_USERNAME_FAIL.getCode(), "更新用户名失败", "");
        }
    }

    /**
     * 更新用户性别
     *
     * @param newUserGender
     * @param request
     * @return
     */
    @RequestMapping("/updateGender/{newUserGender}")
    @ResponseBody
    public BaseResponse updateUserGender(@PathVariable String newUserGender, HttpServletRequest request) {
        String userId = userHelperService.getUserIdFromRedis(request);
        Integer updateRet = userService.updateUserGenderByUserId(userId, newUserGender);
        if (updateRet != null && updateRet.intValue() == 1) {
            return new BaseResponse(StatusEnum.UPDATE_USERNAME_SUCCESS.getCode(), "更新用户名成功", "");
        } else {
            return new BaseResponse(StatusEnum.UPDATE_USERNAME_FAIL.getCode(), "更新用户名失败", "");
        }
    }

    /**
     * 更新用户登录邮箱
     *
     * @param newEmail
     * @param request
     * @return
     */
    @RequestMapping("/updateEmail/{newEmail}")
    @ResponseBody
    public BaseResponse updateUserEmail(@PathVariable String newEmail, HttpServletRequest request) {
        String userId = userHelperService.getUserIdFromRedis(request);
        Integer updateRet = userService.updateUserEmailByUserId(userId, newEmail);
        if (updateRet != null && updateRet.intValue() == 1) {
            return new BaseResponse(StatusEnum.UPDATE_USERNAME_SUCCESS.getCode(), "更新用户名成功", "");
        } else {
            return new BaseResponse(StatusEnum.UPDATE_USERNAME_FAIL.getCode(), "更新用户名失败", "");
        }
    }

    /**
     * 更新用户所在行业
     *
     * @param newPosition
     * @param request
     * @return
     */
    @RequestMapping("/updatePosition/{newPosition}")
    @ResponseBody
    public BaseResponse updatePosition(@PathVariable String newPosition, HttpServletRequest request) {
        String userId = userHelperService.getUserIdFromRedis(request);
        Integer updateRet = userService.updateUserPositionByUserId(userId, newPosition);
        if (updateRet != null && updateRet.intValue() == 1) {
            return new BaseResponse(StatusEnum.UPDATE_USERNAME_SUCCESS.getCode(), "更新用户名成功", "");
        } else {
            return new BaseResponse(StatusEnum.UPDATE_USERNAME_FAIL.getCode(), "更新用户名失败", "");
        }
    }

    @RequestMapping("/updateIndustry/{newIndustry}")
    @ResponseBody
    public BaseResponse updateIndustry(@PathVariable String newIndustry, HttpServletRequest request) {
        String userId = userHelperService.getUserIdFromRedis(request);
        Integer updateRet = userService.updateUserIndustryByUserId(userId, newIndustry);
        if (updateRet != null && updateRet.intValue() == 1) {
            return new BaseResponse(StatusEnum.UPDATE_USERNAME_SUCCESS.getCode(), "更新用户名成功", "");
        } else {
            return new BaseResponse(StatusEnum.UPDATE_USERNAME_FAIL.getCode(), "更新用户名失败", "");
        }
    }

    /**
     * 更新用户简介
     *
     * @param newSimpleDesc
     * @param request
     * @return
     */
    @RequestMapping("/updateSimpleDesc/{newSimpleDesc}")
    @ResponseBody
    public BaseResponse updatSimpleDesc(@PathVariable String newSimpleDesc, HttpServletRequest request) {
        String userId = userHelperService.getUserIdFromRedis(request);
        Integer updateRet = userService.updateUserSimpleDescByUserId(userId, newSimpleDesc);
        if (updateRet != null && updateRet.intValue() == 1) {
            return new BaseResponse(StatusEnum.UPDATE_USERNAME_SUCCESS.getCode(), "更新用户名成功", "");
        } else {
            return new BaseResponse(StatusEnum.UPDATE_USERNAME_FAIL.getCode(), "更新用户名失败", "");
        }
    }

    /**
     * 更新用户简介
     *
     * @param newFullDesc
     * @param request
     * @return
     */
    @RequestMapping("/updateFullDesc/{newFullDesc}")
    @ResponseBody
    public BaseResponse updateFullDesc(@PathVariable String newFullDesc, HttpServletRequest request) {
        String userId = userHelperService.getUserIdFromRedis(request);
        Integer updateRet = userService.updateUserFullDescByUserId(userId, newFullDesc);
        if (updateRet != null && updateRet.intValue() == 1) {
            return new BaseResponse(StatusEnum.UPDATE_USERNAME_SUCCESS.getCode(), "更新用户名成功", "");
        } else {
            return new BaseResponse(StatusEnum.UPDATE_USERNAME_FAIL.getCode(), "更新用户名失败", "");
        }
    }

}