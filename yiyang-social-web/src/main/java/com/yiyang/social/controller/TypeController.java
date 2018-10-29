package com.yiyang.social.controller;

import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.CookieUtils;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.pojo.Stype;
import com.yiyang.pojo.TUser;
import com.yiyang.pojo.UserAuthorityKey;
import com.yiyang.service.social.FindTypeService;
import com.yiyang.service.yunadmin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class TypeController {
    @Autowired
    private FindTypeService findTypeService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private JedisClient jedisClient;
    @RequestMapping(value = "/" )

    public String charts(Model model,HttpServletRequest request, HttpServletResponse response) {
        setAuthorityAndUsername(model,request);
        Stype s1 = new Stype();
        s1.setType( "未回返" );
        int a1 = findTypeService.findType( 1 );
        s1.setFlag( a1 );


        Stype s2 = new Stype();
        int a2 = findTypeService.findType( 2 );
        s2.setFlag( a2 );
        s2.setType( "已回返" );


        Stype s3 = new Stype();
        s3.setType( "未处理" );
        int a3 = findTypeService.findType( 3 );
        s3.setFlag( a3 );


        Stype s4 = new Stype();
        s4.setType( "已拒绝" );
        int a4 = findTypeService.findType( 4 );
        s4.setFlag( a4 );

        List<Stype> list = new ArrayList<Stype>();
        list.add( s1 );
        list.add( s2 );
        list.add( s3 );
        list.add( s4 );

       String jsonList= JsonUtils.objectToJson( list );


        model.addAttribute("list",list );

        return "index";
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