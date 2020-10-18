package com.jsj.service.Impl;

import com.jsj.bean.Community;
import com.jsj.bean.User;
import com.jsj.mapper.UserMapper;
import com.jsj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public Map<String, Object> login(String username, String password) {
        Map<String, Object> map = new HashMap<>();
        User user = userMapper.getUserByPassword(username, password);
        if (user!=null){
            map.put("success",true);
            map.put("username",user.getUsername());
            map.put("userId", user.getId());
            map.put("message","登录成功");
        }else {
            map.put("success",false);
            map.put("message","用户名或密码错误");
        }
        return map;
    }

    @Override
    public Map<String,Object> register(User user) {
        Map<String, Object> map = new HashMap<>();
        if (userMapper.insert(user)>0){
            map.put("success",true);
            map.put("message","注册成功");
        }else {
            map.put("success",false);
            map.put("message","注册失败");
        }
        return map;
    }

    @Override
    public Map<String, Object> update(User user) {
        Map<String,Object> map = new HashMap<>();
        if (userMapper.update(user)>0){
            map.put("success",true);
            map.put("message","修改成功");
        }else {
            map.put("success",false);
            map.put("message","修改失败");
        }
        return map;
    }

    @Override
    public Map<String, Object> userindex(int userId) {
        Map<String,Object> userMap = new HashMap<>();
        User user = userMapper.getById(userId);
        List<Community> communities = userMapper.communitiesByUserId(userId);
        userMap.put("communities",communities);
        userMap.put("user",user);
        userMap.put("dynamics",this.dynamic(userId,0));
        return userMap;
    }

    @Override
    public List<Map<String, Object>> dynamic(int userId, int pageIndex) {
        return userMapper.commentDynamic(userId,pageIndex);
    }
}
