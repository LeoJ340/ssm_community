package com.jsj.service;

import com.jsj.bean.Community;
import com.jsj.bean.CommunityInvitations;

import java.util.List;

public interface CommunityService {

    List<Community> getTopCommunity();

    CommunityInvitations getCommunityInvitations(int communityId);
}
