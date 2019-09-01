package com.ilsxh.redis;

/**
 * @author Tsaizhenya
 */
public class AnswerKey extends BasePrefix {

    private AnswerKey(String prefix) {
        super(prefix);
    }

    private AnswerKey( String prefix, int expireSeconds) {
        super(prefix, expireSeconds);
    }

    public static AnswerKey answerKey = new AnswerKey("");
    public static AnswerKey publicQuestionCountInDayKey = new AnswerKey("questionCountInDay");
    public static AnswerKey publicAnswerCountInDayKey = new AnswerKey("answerCountInDay");
}
