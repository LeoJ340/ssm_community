package com.jsj.controller;

import com.alibaba.fastjson.JSON;
import com.jsj.bean.User;
import com.jsj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 跳转到登录页面
     */
    @RequestMapping(method = RequestMethod.GET,value = "/login")
    public String toLogin(HttpServletRequest request, Model model){
        Cookie [] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("rememberUsername")){
                model.addAttribute(cookie.getName(), cookie.getValue());
            }
            if (cookie.getName().equals("rememberPassword")){
                model.addAttribute(cookie.getName(), cookie.getValue());
            }
        }
        return "login";
    }

    /**
     * 跳转到用户注册页面
     */
    @RequestMapping(method = RequestMethod.GET,value = "/register")
    public String toRegister(){
        return "register";
    }

    @RequestMapping(method = RequestMethod.POST,value = "/login.do")
    @ResponseBody
    public String login(String username, String password, String remember,
                        HttpServletRequest request,HttpServletResponse response) {
        Map<String, Object> map = userService.login(username, password);
        if ((boolean)map.get("success")){
            // 保存cookie
            if (remember!=null&&remember.equals("on")){
                Cookie usernameCookie = new Cookie("rememberUsername",username);
                Cookie passwordCookie = new Cookie("rememberPassword", password);
                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);
            }
            request.getSession().setAttribute("userStatus", true);
            request.getSession().setAttribute("username", map.get("username"));
            request.getSession().setAttribute("userId", map.get("userId"));
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/register.do")
    @ResponseBody
    public String register(User user){
        return JSON.toJSONString(userService.register(user));
    }

    @RequestMapping(method = RequestMethod.GET, value ="logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("userStatus");
        request.getSession().removeAttribute("username");
        request.getSession().removeAttribute("userId");
        return "redirect:/";
    }
}
