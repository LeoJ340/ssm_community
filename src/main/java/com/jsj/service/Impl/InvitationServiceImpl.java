package com.jsj.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jsj.bean.Invitation;
import com.jsj.bean.InvitationUser;
import com.jsj.bean.InvitationUserCommunity;
import com.jsj.mapper.InvitationMapper;
import com.jsj.service.InvitationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class InvitationServiceImpl implements InvitationService {

    @Autowired
    private InvitationMapper invitationMapper;

    @Override
    public List<InvitationUserCommunity> getTopInvitation() {
        return  invitationMapper.getTopInvitation();
    }

    @Override
    public InvitationUser getInvitationUserById(int id) {
        return invitationMapper.getInvitationUserById(id);
    }

    @Override
    public PageInfo<InvitationUser> getInvitationPage(int communityId, int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        List<InvitationUser> invitationUsers = invitationMapper.getInvitationUsersByCommunityId(communityId);
        return new PageInfo <>(invitationUsers);
    }


    @Override
    public Map<String, Object> publishInvitation(Invitation invitation) {
        invitation.setTime(new Date());
        Map<String, Object> map = new HashMap<>();
        if (invitationMapper.insert(invitation)>0){
            map.put("success",true);
            map.put("message","发表成功");
        }else {
            map.put("success",false);
            map.put("message","发表失败");
        }
        return map;
    }
}
