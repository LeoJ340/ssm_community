package com.jsj.service.Impl;

import com.jsj.bean.Community;
import com.jsj.mapper.CommunityMapper;
import com.jsj.service.CommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    private CommunityMapper communityMapper;

    @Override
    public List<Community> getTopCommunity() {
        return communityMapper.getTopCommunity();
    }

    @Override
    public Community getCommunityById(int communityId) {
        return communityMapper.getById(communityId);
    }


    @Override
    public List<Community> getCommunites(String name) {
        return communityMapper.getCommunityLikeName(name);
    }
}
