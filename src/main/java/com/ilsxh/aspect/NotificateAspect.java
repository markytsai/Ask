package com.ilsxh.aspect;

import com.ilsxh.annotation.OperAnnotation;
import com.ilsxh.entity.Message;
import com.ilsxh.entity.Question;
import com.ilsxh.entity.User;
import com.ilsxh.enums.StatusEnum;
import com.ilsxh.exception.CustomException;
import com.ilsxh.service.*;
import com.ilsxh.util.MyConstant;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Tsaizhenya
 */
@Aspect
@Component
public class NotificateAspect extends BaseAspect {

    @Autowired
    private UserHelperService userHelperService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private NotificateService notificateService;
    @Autowired
    private AnswerService answerService;
    @Autowired
    private UserService userService;

    @Pointcut("execution(* com.ilsxh.service.*.*(..))")
    public void notificatePointerCut() {
    }

    @Around(value = "notificatePointerCut() && @annotation(annotation)")
    public Object doAround(ProceedingJoinPoint joinPoint, OperAnnotation annotation) {

        Message message = new Message();

        // 获取request
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes sra = (ServletRequestAttributes) requestAttributes;
        HttpServletRequest request = sra.getRequest();


        // 从cookie中取出用户id，查询数据库
        String userId = userHelperService.getUserIdFromRedis(request);
        if (userId == null) {
            userId = MyConstant.TOURIST_USERID;
        }
        User loginUser = userHelperService.getUserByUserId(userId);
        if (loginUser == null && !userId.equals(MyConstant.TOURIST_USERID)) {
            throw new CustomException(StatusEnum.OPERATION_ERROR);
        }


        // 从切点上获取目标方法
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();

        String[] paramNames = signature.getParameterNames();
        Map<String, Object> paramMap = new HashMap<>(paramNames.length);
        for (int i = 0; i < paramNames.length; i++) {
            paramMap.put(paramNames[i], i);
        }
        Map<String, Object> params = getArgsMap(joinPoint, paramMap);


        //处理入参日志
        try {
            insertMessageTable(message, loginUser, annotation.descpition(), params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Object result = null;
        try {
            result = joinPoint.proceed();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }

        return result;

    }

    private void insertMessageTable(Message message, User user, String actionType, Map<String, Object> params) {
        String msgContent;
        message.setMessageTime(new Timestamp(System.currentTimeMillis()));
        message.setMessageFrom("system");

        if (actionType != null && actionType.equals("提交回答")) {
            message.setMessageType(2);
            Integer questionId = (Integer) params.get("questionId");
            Question question = questionService.getQuestionByQuestionid(questionId);
            message.setMessageTo(question.getUserId());

            msgContent = "" +
                    "<span>\n" +
                    "  <span class='PushNotifications-actor'><a href='http://localhost:8088/userHome/activity/" + user.getUserId() + "'>" + user.getUsername() + "</a></span>\n" +
                    "</span>&nbsp;回答了你提出的&nbsp;\n" +
                    "<span>\n" +
                    "  <a href='/question/" + question.getQuestionId() + "'>" + question.getQuestionTitle() + "</a>\n" +
                    "</span>";
            message.setMessageContent(msgContent);
            message.setMessageType(2);
            notificateService.insertMessage(message);
            // 评论回答
        } else if (actionType.equals("对回答进行评论")) {
            Integer answerId = (Integer) params.get("answerId");
            Integer questionId = answerService.getQuestionIdByAnswerId(answerId);
            Question question = questionService.getQuestionByQuestionid(questionId);
            String userId = answerService.getUserIdByAnswerId(answerId);
            message.setMessageTo(userId);
            msgContent = "" +
                    "<span>\n" +
                    "  <span class='PushNotifications-actor'><a href='http://localhost:8088/userHome/activity/" + user.getUserId() + "'>" + user.getUsername() + "</a></span>\n" +
                    "</span>&nbsp;评论了你在&nbsp;\n" +
                    "<span>\n" +
                    "  <a href='/question/" + question.getQuestionId() + "'>" + question.getQuestionTitle() + "</a>\n" +
                    "</span>&nbsp;下的回答";
            message.setMessageContent(msgContent);
            message.setMessageType(3);
            notificateService.insertMessage(message);
        } else if (actionType.equals("关注用户")) {
            String userIdToBeFollowed = (String) params.get("userIdToBeFollowed");
            Integer followExisted = userService.getUserFollowStatus(user.getUserId(), userIdToBeFollowed);
            if ( followExisted == 1) {
                message.setMessageTo(userIdToBeFollowed);
                msgContent = "" +
                        "<span>\n" +
                        "  <span class='PushNotifications-actor'><a href='http://localhost:8088/userHome/activity/" + user.getUserId() + "'>" + user.getUsername() + "</a></span>\n" +
                        "</span>&nbsp;关注了你&nbsp;";
                message.setMessageContent(msgContent);
                message.setMessageType(4);
                notificateService.insertMessage(message);
            }
        } else if (actionType.equals("对回答投票")) {
            if ((Integer) params.get("upOrDownClick") == 1 && (Integer) params.get("currVoteStatus") != 1) {

                Integer answerId = (Integer) params.get("answerId");
                Integer questionId = answerService.getQuestionIdByAnswerId(answerId);
                Question question = questionService.getQuestionByQuestionid(questionId);
                String userId = answerService.getUserIdByAnswerId(answerId);
                message.setMessageTo(userId);
                msgContent = "" +
                        "<span>\n" +
                        "  <span class='PushNotifications-actor'><a href='http://localhost:8088/userHome/activity/" + user.getUserId() + "'>" + user.getUsername() + "</a></span>\n" +
                        "</span>&nbsp;赞同了你在&nbsp;\n" +
                        "<span>\n" +
                        "  <a href='/question/" + question.getQuestionId() + "'>" + question.getQuestionTitle() + "</a>\n" +
                        "</span>&nbsp;下的回答";
                message.setMessageContent(msgContent);
                message.setMessageType(5);
                notificateService.insertMessage(message);
            }
        }
    }

}
