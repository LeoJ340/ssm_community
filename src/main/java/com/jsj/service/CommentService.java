package com.jsj.service;

import com.jsj.bean.Comment;
import com.jsj.bean.CommentUser;

import java.util.List;
import java.util.Map;

public interface CommentService {

    List<CommentUser> getCommentUser(int InvitationId);

    Map<String, Object> publishComment(Comment comment);
}
