package com.jsj.service;

import com.jsj.bean.User;

public interface UserService {

    User login(String username, String password);

    int register(User user);
}
