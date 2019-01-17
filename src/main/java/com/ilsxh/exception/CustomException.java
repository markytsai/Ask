package com.ilsxh.exception;

import com.ilsxh.enums.StatusEnum;

public class CustomException extends RuntimeException {

    private StatusEnum statusEnum;
    private String errorViewName;

    public CustomException(StatusEnum statusEnum) {
        this.statusEnum = statusEnum;
    }

    public CustomException(StatusEnum statusEnum, String errorViewName) {
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
