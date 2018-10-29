package com.yiyang.social.controller;

import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.CookieUtils;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.pojo.TPreservice;
import com.yiyang.pojo.TService;
import com.yiyang.pojo.TUser;
import com.yiyang.pojo.UserAuthorityKey;
import com.yiyang.service.social.DeletePreserviceByNumService;
import com.yiyang.service.social.SelectAllPreserviceService;
import com.yiyang.service.social.SelectPreserviceByNameService;
import com.yiyang.service.social.SelectServiceByNameService;
import com.yiyang.service.yunadmin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    @Autowired
    private AdminService adminService;
    @Autowired
    private JedisClient jedisClient;
    @RequestMapping(value = "/gongdan")
    public String chart1(Model model,HttpServletRequest request, HttpServletResponse response) {
        setAuthorityAndUsername(model,request);
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
    public String chart3(Model model, HttpServletRequest request, HttpServletResponse response) {
        setAuthorityAndUsername(model,request);
      String name =  request.getParameter( "psUname" );
        System.out.println(name);

      List<TPreservice> result = selectPreserviceByNameService.selectPreserviceByName( name );
        System.out.println(result);
      request.setAttribute( "AllPreservice" ,result);
        return "gongdan";
    }
    public void setAuthorityAndUsername(Model model, HttpServletRequest request)
    {
        String cookie_token_key = CookieUtils.getCookieValue(request, "COOKIE_TOKEN_KEY");
        String json = jedisClient.get("USER_INFO" + ":" + cookie_token_key);
        TUser tUser = JsonUtils.jsonToPojo(json, TUser.class);
        List<UserAuthorityKey> list = adminService.getUserAuthorityKeyByUser(tUser.getUsername());
        model.addAttribute("username",tUser.getUsername());
        model.addAttribute("authorityjson",JsonUtils.objectToJson(list));
    }
}
