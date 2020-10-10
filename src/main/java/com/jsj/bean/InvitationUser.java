package com.jsj.bean;

/**
 * 帖子包含用户信息
 */
public class InvitationUser extends Invitation {

    private String username;

    private String userAvatar;

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
}
