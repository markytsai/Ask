package com.ilsxh.redis;

public class AnswerKey extends BasePrefix {

    private AnswerKey(String prefix) {
        super(prefix);
    }

    private AnswerKey(int expireSeconds, String prefix) {
        super(expireSeconds, prefix);
    }

    public static AnswerKey answerKey = new AnswerKey("");
}
