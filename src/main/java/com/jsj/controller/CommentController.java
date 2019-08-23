package com.jsj.controller;

import com.alibaba.fastjson.JSON;
import com.jsj.bean.Comment;
import com.jsj.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("publishComment")
    @ResponseBody
    public String publishFirstComment(Comment comment){
        return JSON.toJSONString(commentService.publishComment(comment));
    }

}