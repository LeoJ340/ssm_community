package com.jsj.service;

import com.jsj.bean.CommentUser;

import java.util.List;

public interface CommentService {

    List<CommentUser> getCommentUser(int InvitationId);
}
