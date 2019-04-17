package com.ilsxh.redis;

public class HotDataKey extends BasePrefix {

    public HotDataKey(String prefix) {
        super(prefix);
    }

    public HotDataKey(String prefix, int expireSeconds) {
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

//    侧边栏，热门模块
    public static final HotDataKey hotQuestionKey = new HotDataKey("hotQuestionKey", 129600);
    public static final HotDataKey hotUserKey = new HotDataKey("hotUserKey", 129600);
    public static final HotDataKey hotTopicsKey = new HotDataKey("hotTopicKey", 129600);
    public static final HotDataKey newestQuestionKey = new HotDataKey("newestQuestionKey", 129600);

    public static final HotDataKey hotQuestionDetailKey = new HotDataKey("hotQuestionDetailKey", 10000);

    public static final HotDataKey hotQuestionAnswerListKey = new HotDataKey("hotQuestionAnswerListKey", 10000);

}
