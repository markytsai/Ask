package com.ilsxh.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import static com.ilsxh.interceptor.LoginInterceptor.isLoginOrReg;

/**
 * @author Tsaizhenya
 */
public class TouristInterceptor extends HandlerInterceptorAdapter {

    private List<String> touristRequestUrlList = Arrays.asList("/question/", "/topic/", "/userHome/");

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
        // 通过请求头判断请求是否来自Ajax
        if (request.getHeader("x-requested-with") != null && "XMLHttpRequest".equalsIgnoreCase(
                request.getHeader("x-requested-with"))) {
            //ajax方法
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
