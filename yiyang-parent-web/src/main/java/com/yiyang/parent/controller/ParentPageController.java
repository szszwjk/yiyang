package com.yiyang.parent.controller;

import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.CookieUtils;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.pojo.ParentInfo;
import com.yiyang.pojo.TUser;
import com.yiyang.service.parent.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ParentPageController {
    @Autowired
    private ParentService parentService;
    @Autowired
    private JedisClient jedisClient;
    @RequestMapping("/")
    public String index(Model model, HttpServletRequest request, HttpServletResponse response)
    {
//        String cookie_token_key = CookieUtils.getCookieValue(request, "COOKIE_TOKEN_KEY");
//        String json = jedisClient.get("USER_INFO" + ":" + cookie_token_key);
//        TUser tUser = JsonUtils.jsonToPojo(json, TUser.class);
//        ParentInfo info = parentService.getParentInfo(tUser.getUsername());
        ParentInfo info = parentService.getParentInfo("szszwjk");
        System.out.println(info);
        model.addAttribute("item",info);
        return "parentindex";
    }
    @RequestMapping("/parentservice")
    public String service()
    {
        return "parentservice";
    }
}
