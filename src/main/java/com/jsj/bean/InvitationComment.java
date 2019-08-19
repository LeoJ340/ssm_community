package com.jsj.bean;

import	java.util.List;

public class InvitationComment extends InvitationCommunity {

    private List <CommentVo> commentVos;

    public List<CommentVo> getCommentVos() {
        return commentVos;
    }

    public void setCommentVos(List<CommentVo> commentVos) {
        this.commentVos = commentVos;
    }

}
