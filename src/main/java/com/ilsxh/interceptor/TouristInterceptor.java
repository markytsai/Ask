package com.ilsxh.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

import static com.ilsxh.interceptor.LoginInterceptor.isLoginOrReg;

public class TouristInterceptor extends HandlerInterceptorAdapter {

    List<String> needTokenUrlList = Arrays.asList("/", "/index", "/following", "/recommend", "/followUser", "/followTopic");

    private List<String> touristRequestUrlList = Arrays.asList("/question/", "/topic/", "/userHome/", "/search/");

    boolean isNeedTokenUrls(String requestUrl) {
        for (String s : touristRequestUrlList) {
            if (requestUrl.startsWith(s)) {
                return false;
            }
        }
        return true;
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
        request.getRequestDispatcher("login").forward(request, response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
}
