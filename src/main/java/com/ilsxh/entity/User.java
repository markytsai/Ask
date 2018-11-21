package com.ilsxh.entity;

import lombok.Data;

@Data
public class User {
    /**
     * 用户ID
     */
    private Integer userId;
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
    private Long joinTime;


}
