package com.jsj.controller;

import com.jsj.bean.User;
import com.jsj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 跳转到登录页面
     */
    @RequestMapping(method = RequestMethod.GET,value = "toLogin")
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
    @RequestMapping(method = RequestMethod.GET,value = "toRegister")
    public String toRegister(){
        return "register";
    }

    @RequestMapping(method = RequestMethod.POST,value = "login")
    public String login(Model model,  String username, String password, boolean remember,
                        HttpServletRequest request, HttpServletResponse response) {
        User user = userService.login(username, password);
        if (user!=null){
            // 保存cookie
            if (remember){
                Cookie usernameCookie = new Cookie("rememberUsername",username);
                Cookie passwordCookie = new Cookie("rememberPassword", password);
                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);
            }
            request.getSession().setAttribute("userStatus", true);
            request.getSession().setAttribute("user", user);
            model.addAttribute("user", user);
        }
        return "index";
    }

    @RequestMapping(method = RequestMethod.POST, value = "register")
    public String register(User user){
        userService.register(user);
        return "index";
    }
}
