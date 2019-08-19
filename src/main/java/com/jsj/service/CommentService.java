package com.jsj.service;

import com.jsj.bean.CommentVo;

import java.util.List;

public interface CommentService {

    List<CommentVo> getCommentVo(int InvitationId);
}
