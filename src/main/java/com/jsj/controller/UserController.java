package com.jsj.controller;

import com.alibaba.fastjson.JSON;
import com.jsj.bean.User;
import com.jsj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    // 默认头像
    private final String defaultAvatar = "data:image/png;base64,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";

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
        user.setAvatar(this.defaultAvatar);
        return JSON.toJSONString(userService.register(user));
    }

    @RequestMapping(method = RequestMethod.GET, value ="logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("userStatus");
        request.getSession().removeAttribute("username");
        request.getSession().removeAttribute("userId");
        return "redirect:/";
    }

    @GetMapping("/user/{id}")
    public String userIndex(Model model, @PathVariable int id){
        model.addAttribute("userMap",userService.userindex(id));
        return "/user/index";
    }

    @RequestMapping("/user/update")
    @ResponseBody
    public String update(User user,HttpServletRequest request){
        Map<String,Object> result = userService.update(user);
        request.getSession().removeAttribute("userStatus");
        request.getSession().removeAttribute("username");
        request.getSession().removeAttribute("userId");
        return JSON.toJSONString(result);
    }

    @GetMapping("/user/dynamic/{id}/{pageIndex}")
    public String dynamic(Model model,@PathVariable int id, @PathVariable int pageIndex){
        List<Map<String,Object>> dynamics = userService.dynamic(id,pageIndex);
        if (dynamics.isEmpty()){
            return "redirect:/user/noData";
        }
        model.addAttribute("dynamics",dynamics);
        return "/user/dynamic";
    }

    @GetMapping("/user/noData")
    @ResponseBody
    public String noData(){
        Map<String,Object> map = new HashMap<>();
        map.put("isEmpty",true);
        return JSON.toJSONString(map);
    }
}
