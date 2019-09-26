package com.jsj.service;

import com.github.pagehelper.PageInfo;
import com.jsj.bean.Comment;
import com.jsj.bean.CommentUser;

import java.util.Map;

public interface CommentService {

    PageInfo<CommentUser> getCommentUserByCinId(int cinId, int pageIndex, int pageSize);

    PageInfo<CommentUser> getCommentUser(int InvitationId, int pageIndex, int pageSize);

    Map<String, Object> publishComment(Comment comment);
}
