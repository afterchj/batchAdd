package com.kd.mvc.entity;

import java.io.Serializable;

public class ResultMessage implements Serializable {


    private static final long serialVersionUID = 1L;

    private int result;

    private String message;

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }


}