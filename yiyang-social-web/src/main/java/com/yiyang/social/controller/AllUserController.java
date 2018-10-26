package com.yiyang.social.controller;

import com.yiyang.common.utils.JsonUtils;
import com.yiyang.pojo.TUserInfo;
import com.yiyang.service.social.SelectAllUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class AllUserController {
    @Autowired
    public SelectAllUserService selectAllUserService;

    @RequestMapping("/dangan")
    public String charts(HttpServletRequest request, HttpServletResponse response, Model mod) {
       List< TUserInfo > list = selectAllUserService.SelectAllUser();

        String json = JsonUtils.objectToJson( list );
        mod.addAttribute("list",list );
        return "dangan";

    }
}