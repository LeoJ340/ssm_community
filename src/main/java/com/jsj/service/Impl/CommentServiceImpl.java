package com.jsj.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jsj.bean.Comment;
import com.jsj.bean.CommentUser;
import com.jsj.mapper.CommentMapper;
import com.jsj.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public PageInfo<CommentUser> getCommentUserByCinId(int cinId, int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex,pageSize);
        List<CommentUser> commentUsers = commentMapper.getCommentByCinId(cinId);
        return new PageInfo<>(commentUsers);
    }

    @Override
    public PageInfo<CommentUser> getCommentUser(int invitationId,int pageIndex,int pageSize) {
        PageHelper.startPage(pageIndex,pageSize);
        List<CommentUser> commentUsers = commentMapper.getCommentsByInvitationId(invitationId);
        return new PageInfo<>(commentUsers);
    }

    @Override
    @Transactional
    public Map<String, Object> publishComment(int invitationUserId,Comment comment) {
        comment.setTime(new Date());
        Map<String, Object> map = new HashMap<>();
        if (commentMapper.insert(comment)>0){
            commentMapper.notice(invitationUserId,comment.getId());
            map.put("success",true);
            map.put("message","评论成功");
        }else {
            map.put("success",false);
            map.put("message","评论失败");
        }
        return map;
    }


}
