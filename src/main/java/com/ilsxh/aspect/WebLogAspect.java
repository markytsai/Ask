package com.ilsxh.aspect;

import com.ilsxh.annotation.OperAnnotation;
import com.ilsxh.dao.LogDao;
import com.ilsxh.entity.Log;
import com.ilsxh.entity.User;
import com.ilsxh.enums.StatusEnum;
import com.ilsxh.response.BaseResponse;
import com.ilsxh.service.UserHelperService;
import com.ilsxh.util.IPUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;


@Aspect
@Component
public class WebLogAspect {

    @Autowired
    private UserHelperService userHelperService;

    @Autowired
    private LogDao logDao;

    @Pointcut("execution(* com.ilsxh.service.*.*(..))")
    public void pointerCutMethod() {
    }

    /**
     * 环绕通知
     *
     * @param joinPoint
     * @param annotation
     * @return
     */
    @Around(value = "pointerCutMethod() && @annotation(annotation)")
    public Object doAround(ProceedingJoinPoint joinPoint, OperAnnotation annotation) {
        Log log = new Log();
        //通过注解获取当前属于那个模块
        log.setModuleName(annotation.moduleName());
        //通过注解获取当前的操作方式
        log.setOperation(annotation.option());
        log.setCreateDate(new Date().getTime());

        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        Long beginTime = System.currentTimeMillis();

        if (ra != null) {
            ServletRequestAttributes sra = (ServletRequestAttributes) ra;
            HttpServletRequest request = sra.getRequest();
//            String ip = request.getRemoteHost();
            String ip = IPUtils.getClientIp(request);
            log.setUserIp(ip);
            // 从session中获取用户信息

            // 从cookie中取出用户id，查询数据库
            String userId = userHelperService.getUserIdFromRedis(request);
            User loginUser = userHelperService.getUserByUserId(userId);

            if (loginUser != null) {
                log.setUsername(loginUser.getUsername());
            } else {
                if ("doLogin".equals(joinPoint.getSignature().getName())) {
                    log.setUsername(joinPoint.getArgs()[0].toString());
                }
            }
        }
        try {
            Object object = joinPoint.proceed();
            if (object != null) {
//                if (object instanceof Map) {
                log.setOperResult("成功");
//                    if(MapUtils.getBoolean((Map)object, "status")){
//                    }else {
//                        log.setOperResult(MapUtils.getString((Map) object, "msg"));
//                    }

//                }
            }
            log.setWorkTime((System.currentTimeMillis() - beginTime) / 1000);
            Integer effectRow = logDao.insertLog(log);
            if (effectRow == null || effectRow < 1) {
                return object;
            }
            return object;
        } catch (Throwable e) {
            log.setWorkTime((System.currentTimeMillis() - beginTime) / 1000);
            log.setOperResult("失败：" + e.getMessage());
            logDao.insertLog(log);
            return null;
        }
    }
}
