package com.ilsxh.entity;

import java.sql.Timestamp;

public class Activity {

    /**
     * answer contains question and user entity
     * activity --> answer --> question --> user
     */
    private Answer answer;

    /**
     * Voting answer: 1
     * Write answer: 2
     * Collect answer: 3
     *
     * Following question: 4
     * Raised question: 5
     *
     * Follow user: 6
     */
    private Integer activityStaus;

    private Timestamp createTime;

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }

    public Integer getActivityStaus() {
        return activityStaus;
    }

    public void setActivityStaus(Integer activityStaus) {
        this.activityStaus = activityStaus;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
}
