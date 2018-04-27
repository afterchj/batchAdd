package com.kd.mvc.model;

import java.io.Serializable;

public class HptMessage implements Serializable {

    private String user_id;
    private String task_id;
    private String data_id;
    private String app_id;
    private String state_from;
    private String state_to;

    public HptMessage() {
    }

    public HptMessage(String userId, String taskId, String dataId, String appId) {
        this.user_id = userId;
        this.task_id = taskId;
        this.data_id = dataId;
        this.app_id = appId;
    }

    public HptMessage(String userId, String taskId, String dataId, String appId, String stateFrom) {
        this.user_id = userId;
        this.task_id = taskId;
        this.data_id = dataId;
        this.app_id = appId;
        this.state_from = stateFrom;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getTask_id() {
        return task_id;
    }

    public void setTask_id(String task_id) {
        this.task_id = task_id;
    }

    public String getData_id() {
        return data_id;
    }

    public void setData_id(String data_id) {
        this.data_id = data_id;
    }

    public String getApp_id() {
        return app_id;
    }

    public void setApp_id(String app_id) {
        this.app_id = app_id;
    }

    public String getState_from() {
        return state_from;
    }

    public void setState_from(String state_from) {
        this.state_from = state_from;
    }

    public String getState_to() {
        return state_to;
    }

    public void setState_to(String state_to) {
        this.state_to = state_to;
    }

}
