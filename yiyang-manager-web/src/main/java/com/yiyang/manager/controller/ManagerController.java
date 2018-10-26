package com.yiyang.manager.controller;

import com.yiyang.common.utils.JsonUtils;
import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.*;
import com.yiyang.service.yunadmin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

@Controller
public class ManagerController {
    @Autowired
    private AdminService adminService;
    @RequestMapping("/")
    public String index(Model model)
    {
        TYunadmin adminInfo = adminService.getAdminInfo("szszwjkyun");
        List<UserType> userType = adminService.getUserType();
        List<UserType> comunityType = adminService.getComunity();
        model.addAttribute("item",adminInfo);
        model.addAttribute("itemjson", JsonUtils.objectToJson(adminInfo));
        model.addAttribute("chartdata",JsonUtils.objectToJson(userType));
        model.addAttribute("comunitydata",JsonUtils.objectToJson(comunityType));
        return "managerindex";
    }
    @RequestMapping("/admin/saveadmininfo")
    @ResponseBody
    public YiyangResult updateInfo(TYunadmin tYunadmin)
    {
        tYunadmin.setyUser("szszwjkyun");
        tYunadmin.gettUserInfo().setInfoUser("szszwjkyun");
        YiyangResult yiyangResult = adminService.updateInfo(tYunadmin);
        return yiyangResult;
    }
    @RequestMapping("/admin/getalluser")
    @ResponseBody
    public YiyangPageResult getAllUser(Integer page,Integer rows, String username,String usertype)
    {
        System.out.println(page+" "+rows);
        TUserInfo tUserInfo=new TUserInfo();
        tUserInfo.setInfoUser(username);
        UserAuthorityKey userAuthorityKey=new UserAuthorityKey();
        userAuthorityKey.settUserInfo(tUserInfo);
        userAuthorityKey.setAuthorityGroup(usertype);
        YiyangPageResult allUser = adminService.getAllUser(page, rows, userAuthorityKey);
        return allUser;
    }
    @RequestMapping("/admin/getauthority")
    @ResponseBody
    public List<UserAuthorityKey> getAuthority(String username)
    {
        List<UserAuthorityKey> result = adminService.getUserAuthorityKeyByUser(username);
        return result;
    }
    @RequestMapping("/admin/updateauthority")
    @ResponseBody
    public YiyangResult updateUserAuthority( @RequestBody List<UserAuthorityKey> list){
        String username="";
       if(list.get(0).getAuthorityGroup().equals(""))
       {
           username=list.get(0).getUsername();
           list.remove(0);
       }
       else{
           username=list.get(0).getUsername();
       }
        YiyangResult yiyangResult = adminService.updateUserAuthority(list, username);
        return yiyangResult;

    }
    @RequestMapping("/admin/getallauthority")
    @ResponseBody
    public YiyangPageResult getAllAuthority(Integer page, Integer rows, TAuthority tAuthority){

        YiyangPageResult allUser = adminService.getAllAuthority(page, rows, tAuthority);

        return allUser;

    }
    @RequestMapping("/admin/updateauthorityinfo")
    @ResponseBody
    public YiyangResult updateAuthority(TAuthority tAuthority){
        YiyangResult yiyangResult = adminService.updateAuthority(tAuthority);
        return yiyangResult;
    }
    @RequestMapping("/admin/deleteauthority")
    @ResponseBody
    public YiyangResult deleteAuthority(TAuthority tAuthority)
    {
        YiyangResult yiyangResult = adminService.deleteAuthority(tAuthority);
        return yiyangResult;
    }
    @RequestMapping("/admin/addauthority")
    @ResponseBody
    public YiyangResult addAuthority(TAuthority tAuthority)
    {
        YiyangResult yiyangResult = adminService.addAuthority(tAuthority);
        return yiyangResult;
    }
}
