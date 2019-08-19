package com.jsj.mapper;

import com.jsj.bean.InvitationCommunity;
import com.jsj.bean.Invitation;

import java.util.List;

public interface InvitationMapper extends BaseMapper<Invitation> {

    List<InvitationCommunity> getTopInvitation();

    InvitationCommunity getInvitationCommunityById(int invitationId);
}
