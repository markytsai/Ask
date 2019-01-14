package com.ilsxh.redis;

public class UserKey extends BasePrefix {

    public UserKey(String prefix) {
        super(prefix);
    }

    public UserKey(String prefix, int expireSeconds) {
        super(prefix, expireSeconds);
    }

    @Override
    public int expireSeconds() {
        return super.expireSeconds();
    }

    @Override
    public String getPrefix() {
        return super.getPrefix();
    }

    public static UserKey loginUserKey = new UserKey("loginUserKey", 129600);
}
