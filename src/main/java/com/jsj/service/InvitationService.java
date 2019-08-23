package com.jsj.service;

import com.jsj.bean.Invitation;
import com.jsj.bean.InvitationComment;
import com.jsj.bean.InvitationUserCommunity;

import java.util.List;
import java.util.Map;

public interface InvitationService {

    List<InvitationUserCommunity> getTopInvitation();

    InvitationComment getInvitationComment(int invitationId);

    Map<String, Object> publish(Invitation invitation);
}
