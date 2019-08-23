package com.jsj.mapper;

import com.jsj.bean.Comment;
import com.jsj.bean.CommentUser;

import java.util.List;

public interface CommentMapper extends BaseMapper<Comment> {

    List<CommentUser> getFirstComment(int invitationId);

    List<CommentUser> getSubordinateComment(int cinId);

    int insert(Comment comment);
}
