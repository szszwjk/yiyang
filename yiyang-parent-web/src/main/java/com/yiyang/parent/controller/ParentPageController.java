package com.yiyang.parent.controller;

import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.CookieUtils;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.mapper.UserAuthorityMapper;
import com.yiyang.pojo.*;
import com.yiyang.service.parent.ParentData;
import com.yiyang.service.parent.ParentService;
import com.yiyang.service.yunadmin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class ParentPageController {
    @Autowired
    private ParentService parentService;

    @Autowired
    private ParentData parentData;
    @Autowired
    private AdminService adminService;
    @Autowired
    private JedisClient jedisClient;
    @RequestMapping("/")
    public String index(Model model, HttpServletRequest request, HttpServletResponse response)
    {
        setAuthorityAndUsername(model,request);
        ParentInfo info = parentService.getParentInfo("szszwjk");
        model.addAttribute("item",info);
        return "parentindex";
    }
    @RequestMapping("/parent/parentservice")
    public String service(Model model, HttpServletRequest request)
    {
        setAuthorityAndUsername(model,request);
        return "parentservice";
    }
    @RequestMapping("/parent/parentaccount")
    public String parentaccount(Model model, HttpServletRequest request)
    {
        setAuthorityAndUsername(model,request);
        List<TCommunity> community = parentService.getCommunity();
        TParent result = parentService.getParent("szszwjk");
        String json = JsonUtils.objectToJson(result);
        model.addAttribute("data",json);
        model.addAttribute("data1",result);
        model.addAttribute("list",JsonUtils.objectToJson(community));
        return "parentaccount";
    }
    @RequestMapping("/parent/parentdetction")
    public String parentdetction(Model model, HttpServletRequest request)
    {
        setAuthorityAndUsername(model,request);
        return "parentdetction";
    }
    @RequestMapping("/parent/parentcustody")
    public String parentcustody(Model model, HttpServletRequest request)
    {
        setAuthorityAndUsername(model,request);
        List<TPreoption> list = parentData.getTPreoptionforUsername("szszwjk");
        for(int i=0;i<list.size();i++)
        {
            switch (list.get(i).getPoItem())
            {
                case "xt": list.get(i).setPoItem("血糖"); break;
                case "xy": list.get(i).setPoItem("血氧"); break;
                case "xl": list.get(i).setPoItem("心率"); break;
            }

        }
        model.addAttribute("list",list);
        return "parentcustody";
    }
    @RequestMapping("/parent/parentdocument")
    public String parentDocument(Model model, HttpServletRequest request)
    {
        setAuthorityAndUsername(model,request);
        return "parentdocument";
    }
    @RequestMapping("/parent/parentdoctor")
    public String parentDoctor(Model model, HttpServletRequest request)
    {
        setAuthorityAndUsername(model,request);
        return "parentdoctor";
    }
    public void setAuthorityAndUsername(Model model, HttpServletRequest request)
    {
        String cookie_token_key = CookieUtils.getCookieValue(request, "COOKIE_TOKEN_KEY");
        String json = jedisClient.get("USER_INFO" + ":" + cookie_token_key);
        TUser tUser = JsonUtils.jsonToPojo(json, TUser.class);
        List<UserAuthorityKey> list = adminService.getUserAuthorityKeyByUser(tUser.getUsername());
        model.addAttribute("username",tUser.getUsername());
        model.addAttribute("authorityjson",JsonUtils.objectToJson(list));
    }

}
