package com.yiyang.social.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class TousuController {
    @RequestMapping(value = "/tousu")
    public String demo1(){
        return "tousu";
    }
}
