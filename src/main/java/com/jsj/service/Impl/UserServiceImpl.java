package com.jsj.service.Impl;

import com.jsj.bean.User;
import com.jsj.mapper.UserMapper;
import com.jsj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String username, String password) {
        return userMapper.getUserByPassword(username, password);
    }

    @Override
    public int register(User user) {
        return userMapper.insertUser(user);
    }
}
