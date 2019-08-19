package com.jsj.service.Impl;

import com.jsj.bean.Comment;
import com.jsj.bean.CommentVo;
import com.jsj.bean.InvitationComment;
import com.jsj.bean.User;
import com.jsj.mapper.CommentMapper;
import com.jsj.mapper.UserMapper;
import com.jsj.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service
@Transactional
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<CommentVo> getCommentVo(int InvitationId) {
        List<CommentVo> commentVos = new ArrayList<>();
        List<Comment> comments = commentMapper.getFirstComment(1);
        for (Comment comment:comments) {
            CommentVo commentVo = this.assemblingCommentVo(comment);
//            User user = userMapper.getById(comment.getUserId());
//            commentVo.setcUsername(user.getUsername());
//            commentVo.setPhotoUrl(user.getPhotoUrl());
            List<CommentVo> SubordinateCommentVos = new ArrayList<>();
            List<Comment> SubordinateComments = commentMapper.getSubordinateComment(comment.getId());
            for (Comment subordinateComment: SubordinateComments) {
                CommentVo subordinateCommentVo = this.assemblingCommentVo(subordinateComment);
                SubordinateCommentVos.add(subordinateCommentVo);
            }
            commentVo.setCommentVos(SubordinateCommentVos);
            commentVos.add(commentVo);
        }
        return commentVos;
    }

    /**
     * 装配CommentVo
     */
    public CommentVo assemblingCommentVo(Comment comment){
        CommentVo commentVo = new CommentVo();
        commentVo.setId(comment.getId());
        commentVo.setContent(comment.getContent());
        commentVo.setInvitationId(comment.getInvitationId());
        commentVo.setCinId(comment.getCinId());
        commentVo.setCforId(comment.getCforId());
        commentVo.setUserId(comment.getUserId());
        commentVo.setTime(comment.getTime());
        return commentVo;
    }

}
