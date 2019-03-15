package com.ilsxh.interceptor;

import com.ilsxh.redis.UserKey;
import com.ilsxh.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.thymeleaf.util.ArrayUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

import static com.ilsxh.service.UserService.COOKIE_NAME_TOKEN;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    private List<String> excludedUrls = Arrays.asList("/login", "/toLogin", "/register", "/doRegister");

    @Autowired
    private JedisPool jedisPool;

    @Autowired
    private RedisService redisService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        String requestUri = request.getRequestURI();

        // 是否需要拦截
        for (String s : excludedUrls) {
            if (requestUri.endsWith(s)) {
                return true;
            }
        }

        String loginToken = null;
        // 是否有cookie
        Cookie[] cookies = request.getCookies();
        if (ArrayUtils.isEmpty(cookies)) {
            request.getRequestDispatcher("login").forward(request, response);
            return false;
        } else {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(COOKIE_NAME_TOKEN)) {
                    loginToken = cookie.getValue();
                    break;
                }
            }
        }

        // cookie中是否有loginToken
        if (StringUtils.isEmpty(loginToken)) {
            request.getRequestDispatcher("login").forward(request, response);
            return false;
        }

        String userId = redisService.get(UserKey.loginUserKey, loginToken, String.class);

        // 根据loginToken是否能从redis中获取userId
        if (StringUtils.isEmpty(userId)) {
            request.getRequestDispatcher("login").forward(request, response);
            return false;
        } else {
            if ("/".equals(requestUri) || "/chooseTopic".equals(requestUri)) {
                // 会改变URL
                response.sendRedirect("/following?page=1");
                // 不会改变URL
//                request.getRequestDispatcher("/following").forward(request, response);
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
