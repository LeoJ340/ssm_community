package com.jsj.service;

import com.github.pagehelper.PageInfo;
import com.jsj.bean.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    Map<String, Object> login(String username, String password);

    Map<String, Object> register(User user);

    Map<String,Object> update(User user);

    Map<String, Object> userIndex(int userId);

    PageInfo<Map<String, Object>> dynamics(int userId, int pageIndex, int pageSize);

    PageInfo<Map<String, Object>> invitations(int userId, int pageIndex, int pageSize);

    PageInfo<Map<String, Object>> notices(int userId, int pageIndex, int pageSize);

    int removeNotice(int userId);
}
