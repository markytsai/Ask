package com.ilsxh.entity;

import java.sql.Timestamp;

public class Message {

    private Integer messsageId;
    private Integer messageType;
    private String messageFrom;
    private String messageTo;
    private String messageContent;
    private Timestamp messageTime;

    public Message() {
    }

    public Integer getMesssageId() {
        return messsageId;
    }

    public void setMesssageId(Integer messsageId) {
        this.messsageId = messsageId;
    }

    public Integer getMessageType() {
        return messageType;
    }

    public void setMessageType(Integer messageType) {
        this.messageType = messageType;
    }

    public String getUserId() {
        return messageFrom;
    }

    public void setUserId(String messageFrom) {
        this.messageFrom = messageFrom;
    }

    public String getMessageTo() {
        return messageTo;
    }

    public void setMessageTo(String messageTo) {
        this.messageTo = messageTo;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public Timestamp getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(Timestamp messageTime) {
        this.messageTime = messageTime;
    }
}
