package com.ilsxh.exception;

import com.ilsxh.enums.StatusEnum;
import com.ilsxh.response.BaseResponse;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.validation.BindException;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@ControllerAdvice
public class CustomExceptionResolver {

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public BaseResponse exceptionHandler(Exception e) {

        if (e instanceof CustomException) {
            CustomException ex = (CustomException) e;
            return BaseResponse.create(ex.getStatusEnum(), ExceptionUtils.getStackTrace(ex));
        } else if (e instanceof BindException) {
            BindException ex = (BindException) e;
            List<ObjectError> errors = ex.getAllErrors();
            ObjectError error = errors.get(0);
            String msg = error.getDefaultMessage();
            return BaseResponse.createFail(StatusEnum.FAIL.getCode(), msg);
        } else {
            return BaseResponse.create(StatusEnum.KNOWN_ERROR, ExceptionUtils.getStackTrace(e));
        }
    }
}
