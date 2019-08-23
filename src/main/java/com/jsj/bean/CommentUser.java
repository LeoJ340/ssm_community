package com.jsj.bean;

import java.util.List;

/**
 * 评论包含用户信息
 */
public class CommentUser extends Comment {

    private String username;

    private String cforUsername;

    private List<CommentUser> commentUsers;

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

    public List<CommentUser> getCommentUsers() {
        return commentUsers;
    }

    public void setCommentUsers(List<CommentUser> commentUsers) {
        this.commentUsers = commentUsers;
    }
}
