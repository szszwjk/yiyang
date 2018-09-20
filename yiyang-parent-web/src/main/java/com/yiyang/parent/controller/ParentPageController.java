package com.yiyang.parent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ParentPageController {
    @RequestMapping("/")
    public String index()
    {
        return "parentindex";
    }
    @RequestMapping("/parentservice")
    public String service()
    {
        return "parentservice";
    }
}
