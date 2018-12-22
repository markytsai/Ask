package com.ilsxh.entity;

public class Activity {

    private Answer answer;

    /**
     * Voting answer: 1
     * Answering question: 2
     * Following question: 3
     * Raised question: 4
     */
    private Integer activityStaus;

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
}
