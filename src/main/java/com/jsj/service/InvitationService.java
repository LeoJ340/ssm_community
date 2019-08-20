package com.jsj.service;

import com.jsj.bean.InvitationComment;
import com.jsj.bean.InvitationUserCommunity;

import java.util.List;

public interface InvitationService {

    List<InvitationUserCommunity> getTopInvitation();

    InvitationComment getInvitationComment(int invitationId);
}
