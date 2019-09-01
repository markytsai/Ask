package com.ilsxh.entity;

import java.sql.Timestamp;
import java.util.List;

public class User {
    /**
     * 用户ID
     */
    private String userId;
    /**
     * 用户登陆邮箱
     */
    private String email;
    /**
     * 用户登陆密码
     */
    private String password;
    /**
     * 用户状态
     */
    private Integer activationState;
    private String activationCode;

    /**
     * 用户名
     */
    private String username;
    /**
     * 用户性别
     */
    private Integer gender;
    /**
     * 用户简介
     */
    private String simpleDesc;
    /**
     * 用户头像
     */
    private String avatarUrl;
    /**
     * 居住地
     */
    private String residencePlace;
    /**
     * 用户职业
     */
    private String position;
    /**
     * 用户所在行业
     */
    private String industry;
    /**
     *
     */
    private String career;
    /**
     * 用户教育程度
     */
    private String education;
    /**
     * 用户详细介绍
     */
    private String fullDesc;
    /**
     * 用户被赞 次数
     */
    private Integer likedCount;
    /**
     * 用户被收藏 次数
     */
    private Integer collectedCount;
    /**
     * 用户关注其他人的人数
     */
    private Integer followCount;
    /**
     * 用户被关注人数
     */
    private Integer followedCount;
    /**
     * 用户关注话题的个数
     */
    private Integer followTopicCount;
    /**
     * 用户关注问题的个数
     */
    private Integer followQuestionCount;
    /**
     *
     */
    private Integer followCollectionCount;

    /**
     *
     */
    private Integer scanedCount;
    /**
     *
     */
    private Timestamp joinTime;

    /**
     * 是否已经投票：1：赞同；0：未投票；-1：反对
     */
    private Integer vote;

    /**
     * 是否被关注：1：被关注；0：未被关注
     */
    private Integer followStatus;

    private List<Question> followingQustionList;

    public User() {
    }

    public User(String userId, String username) {
        this.userId = userId;
        this.username = username;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getActivationState() {
        return activationState;
    }

    public void setActivationState(Integer activationState) {
        this.activationState = activationState;
    }

    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getSimpleDesc() {
        return simpleDesc;
    }

    public void setSimpleDesc(String simpleDesc) {
        this.simpleDesc = simpleDesc;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getFullDesc() {
        return fullDesc;
    }

    public void setFullDesc(String fullDesc) {
        this.fullDesc = fullDesc;
    }

    public Integer getLikedCount() {
        return likedCount;
    }

    public void setLikedCount(Integer likedCount) {
        this.likedCount = likedCount;
    }

    public Integer getCollectedCount() {
        return collectedCount;
    }

    public void setCollectedCount(Integer collectedCount) {
        this.collectedCount = collectedCount;
    }

    public Integer getFollowCount() {
        return followCount;
    }

    public void setFollowCount(Integer followCount) {
        this.followCount = followCount;
    }

    public Integer getFollowedCount() {
        return followedCount;
    }

    public void setFollowedCount(Integer followedCount) {
        this.followedCount = followedCount;
    }

    public Integer getFollowTopicCount() {
        return followTopicCount;
    }

    public void setFollowTopicCount(Integer followTopicCount) {
        this.followTopicCount = followTopicCount;
    }

    public Integer getFollowQuestionCount() {
        return followQuestionCount;
    }

    public void setFollowQuestionCount(Integer followQuestionCount) {
        this.followQuestionCount = followQuestionCount;
    }

    public Integer getFollowCollectionCount() {
        return followCollectionCount;
    }

    public void setFollowCollectionCount(Integer followCollectionCount) {
        this.followCollectionCount = followCollectionCount;
    }

    public Integer getScanedCount() {
        return scanedCount;
    }

    public void setScanedCount(Integer scanedCount) {
        this.scanedCount = scanedCount;
    }

    public Timestamp getJoinTime() {
        return joinTime;
    }

    public void setJoinTime(Timestamp joinTime) {
        this.joinTime = joinTime;
    }

    public Integer getVote() {
        return vote;
    }

    public void setVote(Integer vote) {
        this.vote = vote;
    }

    public Integer getFollowStatus() {
        return followStatus;
    }

    public void setFollowStatus(Integer followStatus) {
        this.followStatus = followStatus;
    }

    public String getResidencePlace() {
        return residencePlace;
    }

    public void setResidencePlace(String residencePlace) {
        this.residencePlace = residencePlace;
    }
}
