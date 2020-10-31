package com.jsj.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jsj.bean.Community;
import com.jsj.bean.User;
import com.jsj.mapper.InvitationMapper;
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
    @Autowired
    private InvitationMapper invitationMapper;

    @Override
    public Map<String, Object> login(String username, String password) {
        Map<String, Object> map = new HashMap<>();
        User user = userMapper.getUserByPassword(username, password);
        if (user!=null){
            map.put("success",true);
            map.put("username",user.getUsername());
            map.put("userId", user.getId());
            map.put("message","登录成功");
            map.put("noticeCount",userMapper.getNoticeCount(user.getId()));
        }else {
            map.put("success",false);
            map.put("message","用户名或密码错误");
        }
        return map;
    }

    @Override
    @Transactional
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
    @Transactional
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
    public Map<String, Object> userIndex(int userId) {
        Map<String,Object> userMap = new HashMap<>();
        User user = userMapper.getById(userId);
        List<Community> communities = userMapper.communitiesByUserId(userId);
        userMap.put("communities",communities);
        userMap.put("user",user);
        return userMap;
    }

    @Override
    public PageInfo<Map<String, Object>> dynamics(int userId, int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        List<Map<String,Object>> dynamics = userMapper.commentDynamicsByUserId(userId);
        return new PageInfo<>(dynamics);
    }

    @Override
    public PageInfo<Map<String, Object>> invitations(int userId, int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex,pageSize);
        List<Map<String,Object>> invitations = userMapper.invitationsByUserId(userId);
        return new PageInfo<>(invitations);
    }

    @Override
    public PageInfo<Map<String, Object>> notices(int userId, int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex,pageSize);
        List<Map<String, Object>> notices = userMapper.getNotices(userId);
        for (Map<String,Object> notice:notices) {
            notice.put("username",userMapper.getById((Integer) notice.get("user_id")).getUsername());
            Map<String,Object> map = invitationMapper.getInvitationCommunity((Integer) notice.get("invitation_id"));
            notice.put("invitation",map.get("invitation"));
            notice.put("community",map.get("community"));
        }
        return new PageInfo<>(notices);
    }

    @Override
    @Transactional
    public int removeNotice(int userId) {
        return userMapper.removeNotice(userId);
    }
}
