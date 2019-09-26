package com.jsj.service;

import com.jsj.bean.Community;

import java.util.List;

public interface CommunityService {

    List<Community> getTopCommunity();

    Community getCommunityById(int communityId);

    List<Community> getCommunites(String name);
}
