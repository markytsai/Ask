package com.ilsxh.entity;

import java.util.List;

public class Question {
	/**
	 * 问题ID
	 */
	private Integer questionId;
	/**
	 * 问题名称
	 */
	private String questionTitle;
	/**
	 * 问题内容
	 */
	private String questionContent;
	/**
	 * 所属话题
	 */
//	private String topicKvList;
	/**
	 * 被用户关注次数
	 */
	private Integer followedCount;
	/**
	 * 浏览次数
	 */
	private Integer scanedCount;
	/**
	 * 创建时间
	 */
	private Long createTime;
	/**
	 * 问题提出者ID
	 */
	private Integer userId;
	/**
	 * 问题提出者
	 */
	private User user;
	/**
	 * 回答条数
	 */
	private Integer answerCount;

//	private List<QuestionComment> questionCommentList;


	public Question() {
	}

	public Question(Integer questionId, String questionTitle, String questionContent, Integer followedCount, Long createTime, Integer userId, Integer answerCount) {
		this.questionId = questionId;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.followedCount = followedCount;
		this.createTime = createTime;
		this.userId = userId;
		this.answerCount = answerCount;
	}

	public Integer getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public Integer getFollowedCount() {
		return followedCount;
	}

	public void setFollowedCount(Integer followedCount) {
		this.followedCount = followedCount;
	}

	public Integer getScanedCount() {
		return scanedCount;
	}

	public void setScanedCount(Integer scanedCount) {
		this.scanedCount = scanedCount;
	}

	public Long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getAnswerCount() {
		return answerCount;
	}

	public void setAnswerCount(Integer answerCount) {
		this.answerCount = answerCount;
	}
}