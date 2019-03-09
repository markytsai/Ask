package com.ilsxh.entity;

import java.sql.Timestamp;
import java.util.List;

public class Answer {
    /**
     * 回答ID
     */
    private Integer answerId;
    /**
     * 回答内容
     */
    private String answerContent;
    /**
     * 被赞同次数
     */
    private Integer likedCount;
    /**
     * 被反对次数
     */
    private Integer dislikedCount;

    /**
     * 回答时间
     */
    private Timestamp createTime;
    /**
     * 回答对应的问题ID
     */
    private Integer questionId;
    /**
     * 回答用户
     */
    private String answerUserId;
    /**
     * 回答的问题实体
     */
    private Question question;
    /**
     * 回答的用户实体
     */
    private User user;
    /**
     * 回答是否被收藏
     */
    private Boolean collectAnswer;

    /**
     * 回答的评论个数
     */
    private Integer commentCount;

    /**
     * 评论集合
     */
    private List<AnswerComment> answerCommentList;


    public Integer getAnswerId() {
        return answerId;
    }

    public void setAnswerId(Integer answerId) {
        this.answerId = answerId;
    }

    public String getAnswerContent() {
        return answerContent;
    }

    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }

    public Integer getLikedCount() {
        return likedCount;
    }

    public void setLikedCount(Integer likedCount) {
        this.likedCount = likedCount;
    }

    public Integer getDislikedCount() {
        return dislikedCount;
    }

    public void setDislikedCount(Integer dislikedCount) {
        this.dislikedCount = dislikedCount;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public String getAnswerUserId() {
        return answerUserId;
    }

    public void setAnswerUserId(String userId) {
        this.answerUserId = userId;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Boolean getCollectAnswer() {
        return collectAnswer;
    }

    public void setCollectAnswer(Boolean collectAnswer) {
        this.collectAnswer = collectAnswer;
    }

    public Integer getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(Integer commentCount) {
        this.commentCount = commentCount;
    }

    public List<AnswerComment> getAnswerCommentList() {
        return answerCommentList;
    }

    public void setAnswerCommentList(List<AnswerComment> answerCommentList) {
        this.answerCommentList = answerCommentList;
    }
}