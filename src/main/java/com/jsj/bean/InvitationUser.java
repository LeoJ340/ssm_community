package com.jsj.bean;

/**
 * 帖子包含用户信息
 */
public class InvitationUser extends Invitation {

    private String username;

    private String photoUrl;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }
}
