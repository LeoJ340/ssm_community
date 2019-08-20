package com.jsj.service.Impl;

import com.jsj.bean.CommentUser;
import com.jsj.mapper.CommentMapper;
import com.jsj.mapper.UserMapper;
import com.jsj.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<CommentUser> getCommentUser(int InvitationId) {
        List<CommentUser> commentUsers = commentMapper.getFirstComment(1);
        for (CommentUser commentUser:commentUsers) {
            List<CommentUser> SubordinateCommentUses = commentMapper.getSubordinateComment(commentUser.getId());
            for (CommentUser subordinateCommentUser:SubordinateCommentUses) {
                subordinateCommentUser.setCforUsername(userMapper.getUserByCommentId(subordinateCommentUser.getCforId()).getUsername());
            }
            commentUser.setCommentUsers(SubordinateCommentUses);
        }
        return commentUsers;
    }



}
