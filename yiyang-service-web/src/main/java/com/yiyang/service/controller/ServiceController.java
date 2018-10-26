package com.yiyang.service.controller;

import com.yiyang.common.utils.JsonUtils;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.TService;
import com.yiyang.service.tservice.Tservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ServiceController {

    @Autowired
    private Tservice tservice;
    @RequestMapping("/serviceinfo")
    @ResponseBody
    public ModelAndView findInfoByUser(String sUser){
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
    public ModelAndView findInfo(String sUser){
        sUser="zs1";
        TService tService=tservice.findInfoByUser(sUser);
        System.out.println(tService);
        ModelAndView mv=new ModelAndView();
       mv.addObject("tService",tService);
        return mv;
    }
    @RequestMapping(value = "/serviceInfo",method = RequestMethod.POST)
    public String saveInfo(HttpServletRequest request){
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




}