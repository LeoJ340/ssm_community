package com.jsj.controller;

import com.alibaba.fastjson.JSON;
import com.jsj.bean.Invitation;
import com.jsj.bean.InvitationUser;
import com.jsj.service.CommentService;
import com.jsj.service.CommunityService;
import com.jsj.service.InvitationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class InvitationController {

    @Autowired
    private InvitationService invitationService;

    @Autowired
    private CommunityService communityService;

    @Autowired
    private CommentService commentService;

    @RequestMapping(method = RequestMethod.GET,value = "/invitation/{id}")
    public String toInvitation(Model model, @PathVariable("id")int invitationId,
                               @RequestParam(required = false,defaultValue = "1") Integer pageIndex,
                               @RequestParam(required = false,defaultValue = "10") Integer pageSize){
        InvitationUser invitationUser = invitationService.getInvitationUserById(invitationId);
        if (invitationUser == null){
            return "error";
        }else {
            model.addAttribute("community",communityService.getCommunityById(invitationUser.getCommunityId()));
            model.addAttribute("invitation",invitationUser);
            model.addAttribute("comments", commentService.getCommentUser(invitationId,pageIndex,pageSize));
            return "invitation";
        }
    }

    @RequestMapping(method = RequestMethod.POST, value = "/publishInvitation")
    @ResponseBody
    public String string(Invitation invitation){
        return JSON.toJSONString(invitationService.publishInvitation(invitation));
    }

}
