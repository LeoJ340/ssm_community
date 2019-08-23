package com.jsj.service.Impl;

import com.jsj.bean.Comment;
import com.jsj.bean.CommentUser;
import com.jsj.mapper.CommentMapper;
import com.jsj.mapper.UserMapper;
import com.jsj.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@Transactional
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<CommentUser> getCommentUser(int invitationId) {
        List<CommentUser> commentUsers = commentMapper.getFirstComment(invitationId);
        for (CommentUser commentUser:commentUsers) {
            List<CommentUser> SubordinateCommentUses = commentMapper.getSubordinateComment(commentUser.getId());
            for (CommentUser subordinateCommentUser:SubordinateCommentUses) {
                subordinateCommentUser.setCforUsername(userMapper.getUserByCommentId(subordinateCommentUser.getCforId()).getUsername());
            }
            commentUser.setCommentUsers(SubordinateCommentUses);
        }
        return commentUsers;
    }

    @Override
    public Map<String, Object> publishComment(Comment comment) {
        comment.setTime(new Date());
        Map<String, Object> map = new HashMap<>();
        if (commentMapper.insert(comment)>0){
            map.put("success",true);
            map.put("message","评论成功");
        }else {
            map.put("success",false);
            map.put("message","评论失败");
        }
        return map;
    }


}
