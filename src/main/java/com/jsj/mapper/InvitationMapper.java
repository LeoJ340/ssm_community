package com.jsj.mapper;

import com.jsj.bean.InvitationUser;
import com.jsj.bean.InvitationUserCommunity;
import com.jsj.bean.Invitation;

import java.util.List;

public interface InvitationMapper extends BaseMapper<Invitation> {

    List<InvitationUserCommunity> getTopInvitation();

    InvitationUser getInvitationUserById(int invitationId);

    List<InvitationUser> getInvitationUsersByCommunityId(int communityId);

    int insert(Invitation invitation);
}
