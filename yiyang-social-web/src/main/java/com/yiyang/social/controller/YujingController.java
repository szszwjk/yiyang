package com.yiyang.social.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class YujingController {
    @RequestMapping(value = "/yujing")
    public String demo1(){
        return "yujing";
    }
}
