package com.ilsxh.exception;

import com.ilsxh.enums.StatusEnum;

/**
 * @author Tsaizhenya
 */
public class CustomException extends RuntimeException {

    private StatusEnum statusEnum;
    private String errorViewName;

    public CustomException(StatusEnum statusEnum) {
        super("自定义错误");
        this.statusEnum = statusEnum;
    }

    public CustomException(StatusEnum statusEnum, String errorDetail) {
        super(errorDetail);
        this.statusEnum = statusEnum;
        this.errorViewName = errorViewName;
    }

    public StatusEnum getStatusEnum() {
        return statusEnum;
    }

    public String getErrorViewName() {
        return errorViewName;
    }
}
