package com.ilsxh.redis;

public class TopicKey extends BasePrefix {

    public TopicKey(String prefix) {
        super(prefix);
    }

    public TopicKey(String prefix, int expireSeconds) {
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

    // 话题页侧边栏，相关模块
    public static final TopicKey relatedQuestionKey = new TopicKey("relatedQuestionKey", 129600);
    public static final TopicKey relatedTopicKey = new TopicKey("relatedTopicKey", 129600);
    public static final TopicKey relatedExcellentUserKey = new TopicKey("relatedExcellentUserKey", 129600);
}
