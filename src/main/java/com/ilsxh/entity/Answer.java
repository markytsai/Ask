package com.ilsxh.entity;

import lombok.Data;

@Data
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
	 * 回答时间
	 */
	private Long createTime;
	/**
	 * 回答对应的问题ID
	 */
	private Integer questionId;
	/**
	 * 回答用户
	 */
	private Integer userId;
	/**
	 * 回答的问题实体
	 */
	private Question question;
	/**
	 * 回答的用户实体
	 */
	private User user;

	private String likeState;
	/**
	 * 回答的评论个数
	 */
	private Integer commentCount;

//	private List<AnswerComment> answerCommentList;


}