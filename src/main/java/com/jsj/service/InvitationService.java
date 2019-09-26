package com.jsj.service;

import com.github.pagehelper.PageInfo;
import com.jsj.bean.Invitation;
import com.jsj.bean.InvitationUser;
import com.jsj.bean.InvitationUserCommunity;

import java.util.List;
import java.util.Map;

public interface InvitationService {

    List<InvitationUserCommunity> getTopInvitation();

    InvitationUser getInvitationUserById(int id);

    PageInfo<InvitationUser> getInvitationPage(int communityId,int pageIndex,int pageSize);

    Map<String, Object> publishInvitation(Invitation invitation);
}
