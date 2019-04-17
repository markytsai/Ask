package com.ilsxh.interceptor;

import com.ilsxh.service.QuestionService;
import com.ilsxh.util.IPUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Tsaizhenya
 */
public class QuestionVisitTimesInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private QuestionService questionService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String requestUri = request.getRequestURI();

        // 判断访问的是不是问题详情页面，统计问题访问的次数
        if (requestUri != null && requestUri.contains("/question")) {

            String ip = IPUtils.getClientIp(request);
            Integer questionId = Integer.valueOf(requestUri.split("/")[2]);
            updateQuestionFollowedCount(questionId);
        }
        return true;
    }

    private synchronized Integer updateQuestionFollowedCount(Integer questionId) {
        Integer retNum = questionService.increQuestionFollowedCount(questionId, 1);
        return retNum;
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
