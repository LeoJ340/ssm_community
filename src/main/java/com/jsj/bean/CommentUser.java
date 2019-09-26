package com.jsj.bean;

/**
 * 评论包含用户信息
 */
public class CommentUser extends Comment {

    private String username;

    private String cforUsername;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCforUsername() {
        return cforUsername;
    }

    public void setCforUsername(String cforUsername) {
        this.cforUsername = cforUsername;
    }

}
