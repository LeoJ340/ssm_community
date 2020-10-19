package com.jsj.controller;

import com.alibaba.fastjson.JSON;
import com.jsj.bean.Comment;
import com.jsj.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    /**
     * 评论区
     */
    @RequestMapping(method = RequestMethod.POST, value = "/getComments")
    public String getCommentUsers(Model model, int cinId,
                                  @RequestParam(required = false,defaultValue = "1") int pageIndex,
                                  @RequestParam(required = false,defaultValue = "5") int pageSize){
        model.addAttribute("comments",commentService.getCommentUserByCinId(cinId,pageIndex,pageSize));
        model.addAttribute("cinId",cinId);
        return "comment";
    }

    @RequestMapping(method = RequestMethod.POST,value = "/publishComment")
    @ResponseBody
    public String publishFirstComment(int invitationUserId,Comment comment){
        return JSON.toJSONString(commentService.publishComment(invitationUserId,comment));
    }

}
