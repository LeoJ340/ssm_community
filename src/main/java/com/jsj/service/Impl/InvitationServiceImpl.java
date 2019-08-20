package com.jsj.service.Impl;

import com.jsj.bean.InvitationComment;
import com.jsj.bean.InvitationUserCommunity;
import com.jsj.mapper.InvitationMapper;
import com.jsj.service.CommentService;
import com.jsj.service.InvitationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service(value = "invitationService")
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
        invitationComment.setStatus(invitationUserCommunity.getStatus());
        invitationComment.setUsername(invitationUserCommunity.getUsername());
        invitationComment.setPhotoUrl(invitationUserCommunity.getPhotoUrl());
        invitationComment.setCommentUsers(commentService.getCommentUser(invitationId));
        return invitationComment;
    }
}
