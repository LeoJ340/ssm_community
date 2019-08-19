package com.jsj.service;

import com.github.pagehelper.PageInfo;
import com.jsj.bean.InvitationComment;
import com.jsj.bean.InvitationCommunity;

public interface InvitationService {

    PageInfo<InvitationCommunity> getTopInvitation(int page, int pageSize);

    InvitationComment getInvitationComment(int invitationId);
}
