package com.yiyang.social.controller;

import com.yiyang.common.utils.JsonUtils;
import com.yiyang.pojo.Stype;
import com.yiyang.service.social.FindTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@Controller
public class TypeController {
    @Autowired
    private FindTypeService findTypeService;

    @RequestMapping("/")

    public String charts(HttpServletRequest request, HttpServletResponse response ,Model mod) {
        Stype s1 = new Stype();
        s1.setType( "未回返" );
        int a1 = findTypeService.findType( 1 );
        s1.setFlag( a1 );
        Stype s2 = new Stype();
        int a2 = findTypeService.findType( 2 );
        s2.setFlag( a2 );
        s2.setType( "已回返" );
        ArrayList<Stype> list = new ArrayList<Stype>();
        list.add( s1 );
        list.add( s2 );
       String jsonList= JsonUtils.objectToJson( list );
        System.out.println(jsonList);
        mod.addAttribute("list",list );

        return "index";
    }

}