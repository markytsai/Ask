package com.ilsxh.entity;

public class Topic {

    private Integer topicId;
    private String topicName;
    private String topicSimpleDesc;
    private String topicFullDesc;
    private String topicFullDescEn;
    private String topicImage;
    private Integer followedCount;

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public String getTopicSimpleDesc() {
        return topicSimpleDesc;
    }

    public void setTopicSimpleDesc(String topicSimpleDesc) {
        this.topicSimpleDesc = topicSimpleDesc;
    }

    public String getTopicFullDesc() {
        return topicFullDesc;
    }

    public void setTopicFullDesc(String topicFullDesc) {
        this.topicFullDesc = topicFullDesc;
    }

    public String getTopicFullDescEn() {
        return topicFullDescEn;
    }

    public void setTopicFullDescEn(String topicFullDescEn) {
        this.topicFullDescEn = topicFullDescEn;
    }

    public String getTopicImage() {
        return topicImage;
    }

    public void setTopicImage(String topicImage) {
        this.topicImage = topicImage;
    }

    public Integer getFollowedCount() {
        return followedCount;
    }

    public void setFollowedCount(Integer followedCount) {
        this.followedCount = followedCount;
    }
}
