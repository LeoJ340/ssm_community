package com.jsj.mapper;

import com.jsj.bean.Comment;

import java.util.List;

public interface CommentMapper extends BaseMapper<Comment> {

    List<Comment> getFirstComment(int invitationId);

    List<Comment> getSubordinateComment(int cinId);
}
