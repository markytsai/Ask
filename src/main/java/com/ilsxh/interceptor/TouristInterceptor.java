package com.ilsxh.interceptor;

import com.ilsxh.redis.UserKey;
import com.ilsxh.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.thymeleaf.util.ArrayUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import static com.ilsxh.interceptor.LoginInterceptor.isLoginOrReg;
import static com.ilsxh.service.UserService.COOKIE_TOKEN_NAME;

/**
 * @author Tsaizhenya
 */
public class TouristInterceptor extends HandlerInterceptorAdapter {

    private List<String> touristRequestUrlList = Arrays.asList("/question/", "/topic/", "/userHome/");
    private List<String> needTokenInAjax = Arrays.asList("/followQuestion", "/voteAnswer", "/collectAnswer", "/deleteAnswer",
            "/updateAnswer", "/submitAnswer", "/followUser", "/uploadAvatar", "/commentAnswer", "/delComment", "/replyComment",
            "/addQuestion");

    @Autowired
    private RedisService redisService;

    boolean isNeedTokenUrls(String requestUrl) {
        for (String s : touristRequestUrlList) {
            if (requestUrl.startsWith(s)) {
                return false;
            }
        }
        return true;
    }

    boolean isNeedTokenInAjax(HttpServletRequest request, String requestUrl) {

        String loginToken = null;
        // 判断HTTTP请求头中是否有cookies
        Cookie[] cookies = request.getCookies();
        if (ArrayUtils.isEmpty(cookies)) {
            return false;
        } else {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(COOKIE_TOKEN_NAME)) {
                    loginToken = cookie.getValue();
                    break;
                }
            }
        }

        // 判断HTTTP请求头中是否有本系统指定的cookie
        if (StringUtils.isEmpty(loginToken)) {
            return false;
        }

        // 根据loginToken是否能从redis中获取userId，判断缓存中的cookie值是否过期
        String userId = redisService.get(UserKey.loginUserKey, loginToken, String.class);
        if (StringUtils.isEmpty(userId)) {
            return false;
        }

        for (String s : needTokenInAjax) {
            if (requestUrl.startsWith(s)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String requestURL = request.getRequestURI();

        if (isLoginOrReg(requestURL)) {
            return true;
        }

        // 如果是不需要token可以直接访问的URL
        if (!isNeedTokenUrls(requestURL)) {
            return true;
        }
        // 通过请求头判断请求是否来自Ajax
        if (request.getHeader("x-requested-with") != null && "XMLHttpRequest".equalsIgnoreCase(
                request.getHeader("x-requested-with"))) {
            //ajax方法，这里需要进一步判断在Ajax请求中哪些是需要token的Ajax请求

            if (isNeedTokenInAjax(request, requestURL)) {
                return true;
            }
            PrintWriter printWriter = response.getWriter();
            response.setStatus(499);
            printWriter.print(requestURL);
        } else {
            request.getRequestDispatcher("/login").forward(request, response);
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView
            modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception
            ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
}
