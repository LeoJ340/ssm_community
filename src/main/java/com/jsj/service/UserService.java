package com.jsj.service;

import com.jsj.bean.User;

import java.util.Map;

public interface UserService {

    Map<String, Object> login(String username, String password);

    Map<String, Object> register(User user);

    Map<String,Object> update(User user);

    // 用户中心
    Map<String, Object> userindex(int userId);
}
