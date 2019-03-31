package com.ilsxh.enums;

import java.util.ArrayList;
import java.util.List;

public enum StatusEnum {

    /** 成功 */
    SUCCESS("1", "操作成功"),
    /** 失败 */
    FAIL("0", "操作失败"),

    LOGIN_ERROR("101", "用户名或密码错误"),
    REGISTER_ERROR("102", "注册出现错误"),

    KNOWN_ERROR("100", "未知错误"),


    OPERATION_ERROR("400", "操作失败"),

    PARAMETER_IS_NULL("200", "传入的参数为空"),
    LOGIN_SUCCESS("1", ""),
    LOGIN_FAILURE("0", ""),
    REGISTER_SUCCESS("1", ""),
    REGISTER_FAILURE ("0", ""),

    FIRST_LOGIN("103", "用户首次登录"),
    CONTINUE_LOGIN("104", "用户持续登录"),

    UPDATE_USERNAME_SUCCESS("105", "更新用户名成功"),
    UPDATE_USERNAME_FAIL("106", "更新用户名失败"),

    FOLLOW_QUESTION("3", "成功关注问题"),
    UNFOLLOW_QUESTION("4", "成功取消关注问题"),
    ;


    /** 枚举值码 */
    private final String code;

    /** 枚举描述 */
    private final String message;

    /**
     * 构建一个 StatusEnum 。
     * @param code 枚举值码。
     * @param message 枚举描述。
     */
    private StatusEnum(String code, String message) {
        this.code = code;
        this.message = message;
    }

    /**
     * 得到枚举值码。
     * @return 枚举值码。
     */
    public String getCode() {
        return code;
    }

    /**
     * 得到枚举描述。
     * @return 枚举描述。
     */
    public String getMessage() {
        return message;
    }

    /**
     * 得到枚举值码。
     * @return 枚举值码。
     */
    public String code() {
        return code;
    }

    /**
     * 得到枚举描述。
     * @return 枚举描述。
     */
    public String message() {
        return message;
    }

    /**
     * 通过枚举值码查找枚举值。
     * @param code 查找枚举值的枚举值码。
     * @return 枚举值码对应的枚举值。
     * @throws IllegalArgumentException 如果 code 没有对应的 StatusEnum 。
     */
    public static StatusEnum findStatus(String code) {
        for (StatusEnum status : values()) {
            if (status.getCode().equals(code)) {
                return status;
            }
        }
        throw new IllegalArgumentException("ResultInfo StatusEnum not legal:" + code);
    }

    /**
     * 获取全部枚举值。
     *
     * @return 全部枚举值。
     */
    public static List<StatusEnum> getAllStatus() {
        List<StatusEnum> list = new ArrayList<StatusEnum>();
        for (StatusEnum status : values()) {
            list.add(status);
        }
        return list;
    }

    /**
     * 获取全部枚举值码。
     *
     * @return 全部枚举值码。
     */
    public static List<String> getAllStatusCode() {
        List<String> list = new ArrayList<String>();
        for (StatusEnum status : values()) {
            list.add(status.code());
        }
        return list;
    }
}
