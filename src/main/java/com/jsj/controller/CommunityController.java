package com.jsj.controller;

import com.jsj.service.CommunityService;
import com.jsj.service.InvitationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommunityController {

    @Autowired
    private CommunityService communityService;

    @Autowired
    private InvitationService invitationService;

    @RequestMapping(method = RequestMethod.GET,value ="index")
    public String index(Model model){
        model.addAttribute("topCommunity", communityService.getTopCommunity());
        model.addAttribute("topInvitation", invitationService.getTopInvitation());
        return "index";
    }

    @RequestMapping(method = RequestMethod.GET,value = "community/{id}")
    public String toCommunity(Model model,@PathVariable("id")Integer communityId){
        model.addAttribute("communityInvitations", communityService.getCommunityInvitations(communityId));
        return "community";
    }

    @RequestMapping(method = RequestMethod.GET,value = "search")
    public String string(Model model,String name){
        model.addAttribute("communites", communityService.getCommunites(name));
        return "search";
    }
}
