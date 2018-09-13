package com.yiyang.sso.controller;

import com.yiyang.common.utils.CookieUtils;

import com.yiyang.common.utils.YiyangResult;

import com.yiyang.pojo.TUser;
import com.yiyang.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Value("${COOKIE_TOKEN_KEY}")
    private String COOKIE_TOKEN_KEY;
    @RequestMapping("/login")
    @ResponseBody
    public YiyangResult login(TUser tUser, String authority, HttpServletRequest request,HttpServletResponse response)
    {
        tUser.setAuthorityGroup(authority);
        YiyangResult yiyangResult = userService.userLogin(tUser);
        if(yiyangResult.getStatus().equals(200))
        {
            String token=yiyangResult.getMsg();
            CookieUtils.setCookie(request, response, COOKIE_TOKEN_KEY, token);
        }
        return yiyangResult;

    }
}
