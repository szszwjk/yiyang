package com.yiyang.service.controller;

import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.TService;
import com.yiyang.service.tservice.Tservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("tService")
public class ServiceController {

    @Autowired
    private Tservice tservice;
    @RequestMapping(value="/serviceinfo",method = RequestMethod.GET)
    public ModelAndView findInfoByUser(String sUser){
        sUser="zs1";
        TService tService=tservice.findInfoByUser(sUser);
        System.out.println(tService);
        ModelAndView mv=new ModelAndView();
        mv.addObject("tService",tService);
        return mv;
    }

}