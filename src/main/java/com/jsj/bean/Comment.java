package com.jsj.bean;

import java.util.Date;

public class Comment {

    private Integer id;

    private Integer invitationId;

    private Integer userId;

    private Integer cinId;

    private Integer cforId;

    private Date time;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getInvitationId() {
        return invitationId;
    }

    public void setInvitationId(Integer invitationId) {
        this.invitationId = invitationId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCinId() {
        return cinId;
    }

    public void setCinId(Integer cinId) {
        this.cinId = cinId;
    }

    public Integer getCforId() {
        return cforId;
    }

    public void setCforId(Integer cforId) {
        this.cforId = cforId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
