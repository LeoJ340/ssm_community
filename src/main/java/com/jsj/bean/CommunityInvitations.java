package com.jsj.bean;

import java.util.List;

public class CommunityInvitations extends Community {

    private List<InvitationUser> invitationUsers;

    public List<InvitationUser> getInvitationUsers() {
        return invitationUsers;
    }

    public void setInvitationUsers(List<InvitationUser> invitationUsers) {
        this.invitationUsers = invitationUsers;
    }
}
