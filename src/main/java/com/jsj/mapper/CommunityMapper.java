package com.jsj.mapper;

import com.jsj.bean.Community;
import com.jsj.bean.CommunityInvitations;

import java.util.List;

public interface CommunityMapper extends BaseMapper<Community> {

    List<Community> getTopCommunity();

    List<CommunityInvitations> getCommunityInvitations(int communityId);
}
