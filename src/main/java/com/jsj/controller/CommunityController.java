package com.jsj.controller;

import com.jsj.bean.Community;
import com.jsj.service.CommunityService;
import com.jsj.service.InvitationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommunityController {

    @Autowired
    private CommunityService communityService;

    @Autowired
    private InvitationService invitationService;

    @RequestMapping(method = RequestMethod.GET,value ="/")
    public String index(Model model){
        model.addAttribute("topCommunity", communityService.getTopCommunity());
        model.addAttribute("topInvitation", invitationService.getTopInvitation());
        return "index";
    }

    @RequestMapping(method = RequestMethod.GET,value = "community/{id}")
    public String toCommunity(Model model,@PathVariable("id")Integer communityId,
                              @RequestParam(required = false,defaultValue = "1") int pageIndex,
                              @RequestParam(required = false,defaultValue = "10") int pageSize){
        Community community = communityService.getCommunityById(communityId);
        if (community == null){
            return "error/404";
        }else {
            model.addAttribute("invitationPage",invitationService.getInvitationPage(communityId,pageIndex, pageSize));
            model.addAttribute("community", community);
            return "community";
        }
    }

    /**
     * 搜索社区
     */
    @RequestMapping(method = RequestMethod.GET,value = "search")
    public String searchCommunity(Model model,String name){
        model.addAttribute("communites", communityService.getCommunites(name));
        return "search";
    }
}
