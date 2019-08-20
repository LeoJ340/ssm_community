package com.jsj.service.Impl;

import com.jsj.bean.Community;
import com.jsj.bean.CommunityInvitations;
import com.jsj.mapper.CommunityMapper;
import com.jsj.mapper.InvitationMapper;
import com.jsj.service.CommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    private CommunityMapper communityMapper;

    @Autowired
    private InvitationMapper invitationMapper;

    @Override
    public List<Community> getTopCommunity() {
        return communityMapper.getTopCommunity();
    }

    @Override
    public CommunityInvitations getCommunityInvitations(int communityId) {
        CommunityInvitations communityInvitations = new CommunityInvitations();
        communityInvitations.setInvitationUsers(invitationMapper.getInvitationUsersByCommunityId(communityId));
        Community community = communityMapper.getById(communityId);
        communityInvitations.setId(community.getId());
        communityInvitations.setName(community.getName());
        communityInvitations.setIntroduction(community.getIntroduction());
        communityInvitations.setStatus(community.getStatus());
        return communityInvitations;
    }
}
