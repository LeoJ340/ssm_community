package com.jsj.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jsj.bean.InvitationComment;
import com.jsj.bean.InvitationCommunity;
import com.jsj.mapper.InvitationMapper;
import com.jsj.service.CommentService;
import com.jsj.service.InvitationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class InvitationServiceImpl implements InvitationService {

    @Autowired
    private InvitationMapper invitationMapper;

    @Override
    public PageInfo<InvitationCommunity> getTopInvitation(int page, int pageSize) {
        PageHelper.startPage(page, pageSize);
        List<InvitationCommunity> invitationVos = invitationMapper.getTopInvitation();
        return new PageInfo<>(invitationVos);
    }

    @Autowired
    private CommentService commentService;

    @Override
    public InvitationComment getInvitationComment(int invitationId) {
        InvitationComment invitationComment = new InvitationComment();
        InvitationCommunity invitationCommunity = invitationMapper.getInvitationCommunityById(invitationId);
        invitationComment.setId(invitationCommunity.getId());
        invitationComment.setTitle(invitationCommunity.getTitle());
        invitationComment.setContent(invitationCommunity.getContent());
        invitationComment.setUserId(invitationCommunity.getUserId());
        invitationComment.setTime(invitationCommunity.getTime());
        invitationComment.setCommunityId(invitationCommunity.getCommunityId());
        invitationComment.setCommunity(invitationCommunity.getCommunity());
        invitationComment.setCommentVos(commentService.getCommentVo(invitationId));
        invitationComment.setStatus(invitationCommunity.getStatus());
        return invitationComment;
    }
}
