package com.jsj.bean;

import java.util.List;

public class CommunityInvitations extends Community {

    private List<Invitation> invitations;

    public List<Invitation> getInvitations() {
        return invitations;
    }

    public void setInvitations(List<Invitation> invitations) {
        this.invitations = invitations;
    }

}
