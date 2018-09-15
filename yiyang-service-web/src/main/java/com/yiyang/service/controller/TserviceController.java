package com.yiyang.service.controller;

import com.yiyang.pojo.TService;
import com.yiyang.service.tservice.TServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/info")
public class TserviceController {

    @Autowired
    private TServiceService tServiceService;
    @RequestMapping("{sUser}")
    @ResponseBody
    public TService getTServiceByUser(String sUser) {
        TService tService=tServiceService.getTServiceByUser(sUser);
        return tService;
    }
}
