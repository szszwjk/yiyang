package com.yiyang.service.controller;

import com.alibaba.dubbo.remoting.exchange.Request;
import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.CookieUtils;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.TServiceitem;
import com.yiyang.pojo.TUser;
import com.yiyang.pojo.UserAuthorityKey;
import com.yiyang.service.tservice.Serviceitem;
import com.yiyang.service.yunadmin.AdminService;
import org.apache.http.HttpRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ServiceItemController {
    @Autowired
    private Serviceitem serviceitem;
    @Autowired
    private AdminService adminService;
    @Autowired
    private JedisClient jedisClient;
    @RequestMapping("/item/serviceitem")
    @ResponseBody
    public YiyangPageResult getTpreservicedcl(Integer page, Integer rows, TServiceitem tServiceitem){

        if(tServiceitem.getSiLarge().equals("")&&tServiceitem.getSiLittle().equals("")){
            YiyangPageResult result=serviceitem.getServiceItem(page,rows);
            return  result;
        }else {
            if(tServiceitem.getSiLarge().equals("")){
                tServiceitem.setSiLarge(null);
            }if(tServiceitem.getSiLittle().equals("")){
                tServiceitem.setSiLittle(null);
            }
            YiyangPageResult result=serviceitem.getByLargeAndlittle(page,rows,tServiceitem);
            return result;
        }
    }
    @RequestMapping("/item/desc1")
    @ResponseBody
    public TServiceitem findBySiId(String siId,Model model){
        int siId1=Integer.parseInt(siId);
        System.out.println(siId);
        TServiceitem tServiceitem=serviceitem.fingBySiId(siId1);
        System.out.println(tServiceitem);
       /* model.addAttribute("tServiceitem",tServiceitem);*/
        return tServiceitem;
    }

  @RequestMapping(value = "/item/add",method = RequestMethod.POST)
    public String insert(Model model,HttpServletRequest request,TServiceitem tServiceitem){
      setAuthorityAndUsername(model,request);
       tServiceitem.setSiUser("zsss");
      tServiceitem.setSiName("222");
        System.out.println(tServiceitem);
        serviceitem.insertServiceItem(tServiceitem);
        return "serviceitem";
    }

    @RequestMapping(value="/item/saveupdate",method = RequestMethod.POST)
    @ResponseBody
    public YiyangResult update(TServiceitem tServiceitem){
        System.out.println("aaa"+tServiceitem);
        serviceitem.updateServiceItem(tServiceitem);
        return YiyangResult.ok();
    }

    @RequestMapping(value = "/item/shanchu",method = RequestMethod.POST)
    public String deleteBySiId(Model model,HttpServletRequest request,String siId){
        setAuthorityAndUsername(model,request);
        siId=request.getParameter("siId");
        int siId1=Integer.parseInt(siId);
        System.out.println(siId1);
        serviceitem.deleteBySiId(siId1);
        return "serviceitem";
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
