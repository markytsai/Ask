package com.ilsxh.entity;

import java.sql.Timestamp;
import java.util.List;

public class Day {

    private Timestamp date;
    List<Message> messageList;

    public Day() {
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public List<Message> getMessageList() {
        return messageList;
    }

    public void setMessageList(List<Message> messageList) {
        this.messageList = messageList;
    }
}
