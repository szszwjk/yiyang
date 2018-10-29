package com.yiyang.social.controller;

import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.CookieUtils;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.pojo.*;
import com.yiyang.service.doctor.DoctorService;
import com.yiyang.service.social.SelectAllDocService;
import com.yiyang.service.social.SelectPointUserService;
import com.yiyang.service.social.SelectUserByIdnumService;
import com.yiyang.service.yunadmin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;



@Controller
public class PointUserController {

    @Autowired
    private SelectPointUserService selectPointUserService;
    @Autowired
    public SelectUserByIdnumService selectUserByIdnumService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private JedisClient jedisClient;

    @RequestMapping(value = "/chaxun", method = RequestMethod.GET)
    public String chart1(Model model, HttpServletRequest request, HttpServletResponse response ) throws UnsupportedEncodingException {
        setAuthorityAndUsername(model,request);
        request.setCharacterEncoding("UTF-8");


//        String infoName =new String(request.getParameter("userName"));
//        String infoTel = request.getParameter("phoneNum");
        String infoName = "王";
        String infoTel = "18234963821";
        List<TUserInfo> tUserInfos = selectPointUserService.SelectPointUser( infoName, infoTel );

        request.setAttribute( "list",tUserInfos );
        TParent tParent = selectUserByIdnumService.SelectUserByIdnum( request.getParameter( "ID" ));
        request.setAttribute( "tparent",tParent );

        TParent update = selectUserByIdnumService.SelectUserByIdnum( request.getParameter( "act" ));
        request.setAttribute( "update",update );


        request.setAttribute( "name",infoName );//输入框回返
        request.setAttribute( "tel",infoTel );
        return "dangan";
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
