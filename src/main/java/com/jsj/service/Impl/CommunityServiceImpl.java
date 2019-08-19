package com.jsj.service.Impl;

import com.jsj.bean.Community;
import com.jsj.mapper.CommunityMapper;
import com.jsj.service.CommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    private CommunityMapper communityMapper;

    @Override
    public List<Community> getTopCommunity() {
        return communityMapper.getTopCommunity();
    }
}
