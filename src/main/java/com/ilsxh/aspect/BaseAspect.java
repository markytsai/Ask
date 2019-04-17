package com.ilsxh.aspect;

import org.aspectj.lang.ProceedingJoinPoint;

import java.util.Collections;
import java.util.Map;

/** 用来被继承，因为getArgsMap方法需要被多次使用
 * @author Tsaizhenya
 */
public class BaseAspect {

    public Map getArgsMap(ProceedingJoinPoint point, Map<String, Object> methodParamNames) {
        Object[] args = point.getArgs();
        if (null == methodParamNames) {
            return Collections.EMPTY_MAP;
        }
        for (Map.Entry<String, Object> entry : methodParamNames.entrySet()) {
            int index = Integer.valueOf(String.valueOf(entry.getValue()));
            if (args != null && args.length > 0) {
                Object arg = (null == args[index] ? "" : args[index]);
                methodParamNames.put(entry.getKey(), arg);
            }
        }
        return methodParamNames;
    }
}
