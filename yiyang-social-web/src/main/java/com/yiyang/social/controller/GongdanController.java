package com.yiyang.social.controller;

import com.yiyang.pojo.TPreservice;
import com.yiyang.pojo.TService;
import com.yiyang.service.social.DeletePreserviceByNumService;
import com.yiyang.service.social.SelectAllPreserviceService;
import com.yiyang.service.social.SelectPreserviceByNameService;
import com.yiyang.service.social.SelectServiceByNameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@Controller
public class GongdanController {
    @Autowired
    SelectAllPreserviceService selectAllPreserviceService;
    @Autowired
    DeletePreserviceByNumService deletePreserviceByNumService;
    @Autowired
    SelectPreserviceByNameService selectPreserviceByNameService;
    @RequestMapping(value = "/gongdan")
    public String chart1(HttpServletRequest request, HttpServletResponse response) {
    List<TPreservice> result = selectAllPreserviceService.selectAllPreservice();
    request.setAttribute( "AllPreservice" ,result);
        return "gongdan";
    }
    @RequestMapping(value = "/shanchu")
    public String chart2(HttpServletRequest request, HttpServletResponse response) {
        String s = request.getParameter( "delete" );

        deletePreserviceByNumService.deletePreserviceByNum( s);
        return "success1";
    }
    @RequestMapping(value = "/chaxunGD" ,method = RequestMethod.GET)
    public String chart3(HttpServletRequest request, HttpServletResponse response) {
      String name =  request.getParameter( "psUname" );
        System.out.println(name);

      List<TPreservice> result = selectPreserviceByNameService.selectPreserviceByName( name );
        System.out.println(result);
      request.setAttribute( "AllPreservice" ,result);
        return "gongdan";
    }
}
