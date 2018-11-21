package com.ilsxh.util;

public class Response {
    /**
     * 1:success;
     * 0:failure
     */
    private int state;
    /**
     * error message
     */
    private String message;
    /**
     * details from backend in format of map
     */
    private Object data;

    public Response() {
    }

    public Response(int state) {
        this.state = state;
    }

    public Response(int state, String message) {
        this.state = state;
        this.message = message;
    }

    public Response(int state, String message, Object data) {
        this.state = state;
        this.message = message;
        this.data = data;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
