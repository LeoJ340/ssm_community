package com.jsj.bean;

/**
 * 评论包含用户信息
 */
public class CommentUser extends Comment {

    private String username;

    private String userAvatar;

    private int cforUserId;

    private String cforUsername;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar;
    }

    public int getCforUserId() {
        return cforUserId;
    }

    public void setCforUserId(int cforUserId) {
        this.cforUserId = cforUserId;
    }

    public String getCforUsername() {
        return cforUsername;
    }

    public void setCforUsername(String cforUsername) {
        this.cforUsername = cforUsername;
    }

}
