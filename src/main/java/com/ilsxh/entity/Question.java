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
//	private Integer scanedCount;
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
//	private User user;
	/**
	 * 回答条数
	 */
	private Integer answerCount;

//	private List<QuestionComment> questionCommentList;

}