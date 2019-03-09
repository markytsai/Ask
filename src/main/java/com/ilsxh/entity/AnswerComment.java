package com.ilsxh.entity;

import java.sql.Timestamp;
import java.util.List;

public class AnswerComment {

    private Integer answerCommentId;

    private String answerCommentContent;

    private Integer likedCount;

    private Timestamp createTime;

    private Integer atAnswerCommentId;

    private String atUserId;

    private String atUserName;

    private Integer answerId;

    private String userId;

    private String likeState;

    private User user;

    private List<AnswerComment> commentReplyList;

    public Integer getAnswerCommentId() {
        return answerCommentId;
    }

    public void setAnswerCommentId(Integer answerCommentId) {
        this.answerCommentId = answerCommentId;
    }

    public String getAnswerCommentContent() {
        return answerCommentContent;
    }

    public void setAnswerCommentContent(String answerCommentContent) {
        this.answerCommentContent = answerCommentContent;
    }

    public Integer getLikedCount() {
        return likedCount;
    }

    public void setLikedCount(Integer likedCount) {
        this.likedCount = likedCount;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getAtUserId() {
        return atUserId;
    }

    public void setAtUserId(String atUserId) {
        this.atUserId = atUserId;
    }

    public String getAtUserName() {
        return atUserName;
    }

    public void setAtUserName(String atUserName) {
        this.atUserName = atUserName;
    }

    public Integer getAnswerId() {
        return answerId;
    }

    public void setAnswerId(Integer answerId) {
        this.answerId = answerId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getLikeState() {
        return likeState;
    }

    public void setLikeState(String likeState) {
        this.likeState = likeState;
    }

    public List<AnswerComment> getCommentReplyList() {
        return commentReplyList;
    }

    public void setCommentReplyList(List<AnswerComment> commentReplyList) {
        this.commentReplyList = commentReplyList;
    }

    public Integer getAtAnswerCommentId() {
        return atAnswerCommentId;
    }

    public void setAtAnswerCommentId(Integer atAnswerCommentId) {
        this.atAnswerCommentId = atAnswerCommentId;
    }

    @Override
    public String toString() {
        return "AnswerComment [answerCommentId=" + answerCommentId + ", answerCommentContent=" + answerCommentContent + ", likedCount=" + likedCount + ", createTime=" + createTime + ", atUserId=" + atUserId + ", atUserName=" + atUserName + ", answerId=" + answerId + ", userId=" + userId
                + ", likeState=" + likeState + ", user=" + user + "]";
    }

}
