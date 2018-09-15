package com.yiyang.service.controller;

import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.pojo.TPreservice;
import com.yiyang.service.tservice.TpreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TpreserviceController {

    @Autowired
    private TpreService tpreService;
    @RequestMapping("/tpreservice/list")
    @ResponseBody
    public YiyangPageResult getTpreservice(Integer page, Integer rows){
           YiyangPageResult result=tpreService.getTpreService(page,rows);
           return  result;
    }
    @RequestMapping("/")
    public String index(){
        return "index";
    }

}
