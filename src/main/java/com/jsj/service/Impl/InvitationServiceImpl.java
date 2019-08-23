package com.jsj.service.Impl;

import com.jsj.bean.Invitation;
import com.jsj.bean.InvitationComment;
import com.jsj.bean.InvitationUserCommunity;
import com.jsj.mapper.InvitationMapper;
import com.jsj.service.CommentService;
import com.jsj.service.InvitationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class InvitationServiceImpl implements InvitationService {

    @Autowired
    private InvitationMapper invitationMapper;

    @Autowired
    private CommentService commentService;

    @Override
    public List<InvitationUserCommunity> getTopInvitation() {
        return  invitationMapper.getTopInvitation();
    }

    @Override
    public InvitationComment getInvitationComment(int invitationId) {
        InvitationComment invitationComment = new InvitationComment();
        InvitationUserCommunity invitationUserCommunity = invitationMapper.getInvitationUserCommunityById(invitationId);
        invitationComment.setId(invitationUserCommunity.getId());
        invitationComment.setTitle(invitationUserCommunity.getTitle());
        invitationComment.setContent(invitationUserCommunity.getContent());
        invitationComment.setUserId(invitationUserCommunity.getUserId());
        invitationComment.setTime(invitationUserCommunity.getTime());
        invitationComment.setCommunityId(invitationUserCommunity.getCommunityId());
        invitationComment.setCommunity(invitationUserCommunity.getCommunity());
        invitationComment.setUsername(invitationUserCommunity.getUsername());
        invitationComment.setCommentUsers(commentService.getCommentUser(invitationId));
        return invitationComment;
    }

    @Override
    public Map<String, Object> publish(Invitation invitation) {
        invitation.setTime(new Date());
        Map<String, Object> map = new HashMap<>();
        if (invitationMapper.insert(invitation)>0){
            map.put("success",true);
            map.put("message","发表成功");
        }else {
            map.put("success",false);
            map.put("message","发表失败");
        }
        return map;
    }
}
