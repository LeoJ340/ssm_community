package com.jsj.service;

import com.jsj.bean.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    Map<String, Object> login(String username, String password);

    Map<String, Object> register(User user);

    Map<String,Object> update(User user);

    // 用户中心
    Map<String, Object> userindex(int userId,String type);

    // 个人动态
    List<Map<String,Object>> dynamic(int userId,int pageIndex);

    List<Map<String,Object>> invitationsByUserId(int userId,int pageIndex);

    List<Map<String,Object>> notices(int userId,int pageIndex);

    int removeNotice(int userId);
}
