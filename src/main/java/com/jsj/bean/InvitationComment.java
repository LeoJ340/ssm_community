package com.jsj.bean;

import	java.util.List;

public class InvitationComment extends InvitationUserCommunity {

    private List <CommentUser> commentUsers;

    public List<CommentUser> getCommentUsers() {
        return commentUsers;
    }

    public void setCommentUsers(List<CommentUser> commentUsers) {
        this.commentUsers = commentUsers;
    }
}
