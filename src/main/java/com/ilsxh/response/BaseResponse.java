package com.ilsxh.response;


import com.ilsxh.enums.StatusEnum;
import com.ilsxh.util.StringUtil;

import java.io.Serializable;

public class BaseResponse<T> implements Serializable {
    private String code;
    private String message;
    private T dataBody;

    public BaseResponse() {}

    public BaseResponse(String code) {
        this.code = code;
    }

    public BaseResponse(T dataBody) {
        this.dataBody = dataBody;
    }

    /**
     * 参数是StatusEnum对象
     * @param statusEnum
     */
    public BaseResponse(StatusEnum statusEnum) {
        if (statusEnum != null){
            this.code = statusEnum.getCode();
            this.message = statusEnum.getMessage();
        }
    }

    /**
     * 参数是code和message
     * @param code
     * @param message
     */
    public BaseResponse(String code, String message) {
        this.code = code;
        this.message = message;
    }

    /**
     * 参数是code，message，dataBody
     * @param code
     * @param message
     * @param dataBody
     */
    public BaseResponse(String code, String message, T dataBody) {
        this.code = code;
        this.message = message;
        this.dataBody = dataBody;
    }

    /**
     * 根据消息体创建响应实例对象
     * @param t
     * @param <T>
     * @return
     */
    public static <T> BaseResponse<T> create(T dataBody){
        return new BaseResponse<T>(dataBody);
    }

    /**
     * 根据数据实体和状态实体创建响应实例对象，不能保证传入的statusEnum不为空
     * @param t
     * @param statusEnum
     * @param <T>
     * @return
     */
    public static <T> BaseResponse<T> create(StatusEnum statusEnum, T dataBody){
        return new BaseResponse<T>(statusEnum.getCode(), statusEnum.getMessage(), dataBody);
    }

    public static <T> BaseResponse<T> create(StatusEnum statusEnum, String message, T dataBody) {
        if (statusEnum != null) {
            return new BaseResponse<T>(statusEnum.getCode(), message, dataBody);
        } else {
            return new BaseResponse<>(StatusEnum.PARAMETER_IS_NULL.getCode(), message, dataBody);
        }

    }
    /**
     * 根据数据实体，和消息创建响应实体--成功--
     * @param t
     * @param message
     * @param <T>
     * @return
     */
    public static <T> BaseResponse<T> createSuccess(String message, T dataBody){
        return new BaseResponse<T>(StatusEnum.SUCCESS.getCode(), StringUtil.isNullOrEmpty(message) ? StatusEnum.SUCCESS.getMessage() : message, dataBody);
    }

    /**
     * 根据数据实体，和消息创建响应实体--失败
     * @param t
     * @param message
     * @param <T>
     * @return
     */
    public static <T> BaseResponse<T> createFail(String message, T dataBody){
        return new BaseResponse<T>(StatusEnum.FAIL.getCode(), StringUtil.isNullOrEmpty(message) ? StatusEnum.FAIL.getMessage() : message, dataBody);
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getDataBody() {
        return dataBody;
    }

    public void setDataBody(T dataBody) {
        this.dataBody = dataBody;
    }

}