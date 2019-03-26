package com.ilsxh.interceptor;

import com.ilsxh.redis.UserKey;
import com.ilsxh.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.thymeleaf.util.ArrayUtils;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

import static com.ilsxh.service.UserService.COOKIE_TOKEN_NAME;

/**
 * @author Tsaizhenya
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

    private static List<String> excludedUrls = Arrays.asList("/login", "/toLogin", "/register", "/doRegister", "/search",
            "/moreHotQuestion", "/tourist");

    private String rootUrl = "/";

    @Autowired
    private RedisService redisService;

    public static boolean isLoginOrReg(String requestUrl) {
        // 如果是登录和注册的操作，不用拦截
        for (String s : excludedUrls) {
            if (requestUrl.startsWith(s)) {
                return true;
            }
        }
        return false;
    }
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        String requestUri = request.getRequestURI();

        if (isLoginOrReg(requestUri)) {
            return true;
        }

        String loginToken = null;
        // 判断HTTTP请求头中是否有cookies
        Cookie[] cookies = request.getCookies();
        if (ArrayUtils.isEmpty(cookies)) {
            request.getRequestDispatcher("login").forward(request, response);
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
            request.getRequestDispatcher("login").forward(request, response);
            return false;
        }

        // 根据loginToken是否能从redis中获取userId，判断缓存中的cookie值是否过期
        String userId = redisService.get(UserKey.loginUserKey, loginToken, String.class);
        if (StringUtils.isEmpty(userId)) {
            request.getRequestDispatcher("login").forward(request, response);
            return false;
        } else {
            if (rootUrl.equals(requestUri)) {
                response.sendRedirect("/following");
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
