package com.jsj.controller;

import com.alibaba.fastjson.JSON;
import com.jsj.bean.Invitation;
import com.jsj.service.InvitationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class InvitationController {

    @Autowired
    private InvitationService invitationService;

    @RequestMapping(method = RequestMethod.GET,value = "invitation/{id}")
    public String toInvitation(Model model, @PathVariable("id")Integer invitationId){
        model.addAttribute("invitationComment", invitationService.getInvitationComment(invitationId));
        return "invitation";
    }

    @RequestMapping(method = RequestMethod.POST, value = "publishInvitation")
    @ResponseBody
    public String string(Invitation invitation){
        return JSON.toJSONString(invitationService.publish(invitation));
    }

}
