package com.yiyang.social.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class testController {
    @RequestMapping("/sdfsdf")
    public String demo1(){
        return "index";
    }

}
