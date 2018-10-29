package com.yiyang.social.controller;

import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.CookieUtils;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.pojo.*;
import com.yiyang.service.social.*;
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
public class AllUserController {
    @Autowired
            public SelectAllUserService selectAllUserService;
    @Autowired
            public SelectUserByIdnumService selectUserByIdnumService;
    @Autowired
            public UpdateTParentService updateTParentService;
    @Autowired
            public SelectAllDocService selectAllDocService;
    @Autowired
            public  SelectAllServiceService selectAllServiceService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private JedisClient jedisClient;
    String id ;
    @RequestMapping(value = "/dangan")
    public String chart1(Model model,HttpServletRequest request, HttpServletResponse response) {
        setAuthorityAndUsername(model,request);
        List< TUserInfo > list = selectAllUserService.SelectAllUser();
        request.setAttribute( "list",list );
        TParent tParent = selectUserByIdnumService.SelectUserByIdnum( request.getParameter( "ID" ));
        request.setAttribute( "tparent",tParent );
        id = request.getParameter( "act" );
        TParent update = selectUserByIdnumService.SelectUserByIdnum( request.getParameter( "act" ));
        request.setAttribute( "update",update );


        //查询出所有的医生，返回集合 result
        List<TDoctor> result = selectAllDocService.selectAllDoc();
        request.setAttribute( "result",result );

        //查询出所有的服务商 返回集合 ServiceResult
        List<TService> ServiceResult = selectAllServiceService.SelectAllService();
        request.setAttribute( "ServiceResult",ServiceResult );

        return "dangan";
    }
    @RequestMapping(value = "/UD",method = RequestMethod.POST)//提交更新表单信息。update
    public String  chart2(HttpServletRequest request, HttpServletResponse response) {

        updateTParentService.UpdateTParent( id,request.getParameter( "juzhudi" ),request.getParameter( "xueli" ),request.getParameter( "chushengdi" ),
                request.getParameter( "xuexing" ),request.getParameter( "guoji" ),request.getParameter( "guominshi" ),
                request.getParameter( "waishang" ),request.getParameter( "shoushushi" ),request.getParameter( "yichuanbing" ),
                request.getParameter( "shequhao" ));

        return "success";
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