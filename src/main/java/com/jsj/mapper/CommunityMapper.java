package com.jsj.mapper;

import com.jsj.bean.Community;

import java.util.List;

public interface CommunityMapper extends BaseMapper<Community> {

    List<Community> getTopCommunity();

    Community getById(Integer id);

    List<Community> getCommunityLikeName(String name);
}
