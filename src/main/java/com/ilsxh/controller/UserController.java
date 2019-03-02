package com.ilsxh.controller;

import com.ilsxh.annotation.OperAnnotation;
import com.ilsxh.enums.StatusEnum;
import com.ilsxh.response.BaseResponse;
import com.ilsxh.service.UserHelperService;
import com.ilsxh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Map;

import static com.ilsxh.util.MyConstant.FIRST_LOGIN_STATUS;

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
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/toLogin")
    @ResponseBody
    public BaseResponse login(@RequestParam("email") String email, @RequestParam("password") String password,
                              @RequestParam("rememberMe") Boolean rememberMe, HttpServletRequest request, HttpServletResponse response) {


        Map<String, Object> userInfoMap = userService.login(email, password, rememberMe, response);

        // 首次登录，跳转到话题选择页面
        return new BaseResponse((String) userInfoMap.get(FIRST_LOGIN_STATUS), "", userInfoMap);

//        if (userInfoMap.get(FIRST_LOGIN_STATUS).equals(StatusEnum.FIRST_LOGIN.getCode())) {
//            return new BaseResponse(StatusEnum.FIRST_LOGIN.getCode(), "首次登录", userInfoMap);
//        } else {
//            return new BaseResponse(StatusEnum.CONTINUE_LOGIN.getCode(), "持续登录", userInfoMap);
//        }
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
        Map<String, Object> userInfoMap = userService.registerNewUser(email, username, password, response);
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
        BaseResponse response = userService.followUser(localUserId, userIdToBeFollowed, new Date().getTime());
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
        userService.logout(request, response);
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


}