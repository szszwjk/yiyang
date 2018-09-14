package com.yiyang.service.controller;

import com.yiyang.common.utils.EasyUIDataGridResult;
import com.yiyang.service.tservice.Tpreservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TpreserviceController {

    @Autowired
    private Tpreservice tpreservice;
    @RequestMapping("/tpreservice/list")
    public EasyUIDataGridResult getTpreservice(Integer page,Integer rows){
           EasyUIDataGridResult result=tpreservice.getTPreservice(page,rows);
           return  result;
    }
}
