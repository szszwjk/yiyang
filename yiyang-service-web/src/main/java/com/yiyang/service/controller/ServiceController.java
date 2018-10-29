package com.yiyang.service.controller;

import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.CookieUtils;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.TService;
import com.yiyang.pojo.TUser;
import com.yiyang.pojo.UserAuthorityKey;
import com.yiyang.service.tservice.Tservice;
import com.yiyang.service.yunadmin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ServiceController {

    @Autowired
    private Tservice tservice;
    @Autowired
    private AdminService adminService;
    @Autowired
    private JedisClient jedisClient;
    @RequestMapping("/serviceinfo")
    @ResponseBody
    public ModelAndView findInfoByUser(Model model, HttpServletRequest request,String sUser){
        setAuthorityAndUsername(model,request);
        sUser="zs1";
        TService tService=tservice.findInfoByUser(sUser);
        System.out.println(tService);
        ModelAndView mv=new ModelAndView();
        mv.addObject("tService",tService);
        mv.addObject("tServiceJson", JsonUtils.objectToJson(tService));
        return mv;
    }
    @RequestMapping("/index")
    @ResponseBody
    public ModelAndView findInfo(Model model, HttpServletRequest request,String sUser){
        setAuthorityAndUsername(model,request);
        sUser="zs1";
        TService tService=tservice.findInfoByUser(sUser);
        System.out.println(tService);
        ModelAndView mv=new ModelAndView();
       mv.addObject("tService",tService);
        return mv;
    }
    @RequestMapping(value = "/serviceInfo",method = RequestMethod.POST)
    public String saveInfo(Model model, HttpServletRequest request){
        setAuthorityAndUsername(model,request);
        TService tService=new TService();
        tService.setsUser(request.getParameter("sUser"));
        System.out.println(request.getParameter("sUser"));
        tService.setsCnum(request.getParameter("sCnum"));
        tService.setsDescribe(request.getParameter("sDescribe"));
        tService.setsInfo2(request.getParameter("sInfo2"));
        tService.setsInfo3(request.getParameter("sInfo3"));
        tService.setsAddress(request.getParameter("sAddress"));
        tService.setsFlag(request.getParameter("sFlag"));
        tService.setsName(request.getParameter("sName"));
        tService.setsNumber(request.getParameter("sNumber"));
       // tService.settUserInfo(request.getParameter("infoTel"));
        System.out.println(tService);
        tservice.updateByUser(tService);
        return "serviceinfo";
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