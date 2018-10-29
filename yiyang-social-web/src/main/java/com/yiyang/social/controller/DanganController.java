package com.yiyang.social.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.CookieUtils;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.pojo.*;
import com.yiyang.service.doctor.DoctorService;
import com.yiyang.service.social.SelectServiceByNameService;
import com.yiyang.service.yunadmin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller
    public class DanganController {
        @Autowired
        public DoctorService doctorService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private JedisClient jedisClient;
        @RequestMapping(value = "/chaxunYS", method = RequestMethod.GET)

        public String chart2(Model model,HttpServletRequest request, HttpServletResponse response ) throws UnsupportedEncodingException {
            setAuthorityAndUsername(model,request);
            request.setCharacterEncoding("UTF-8");
        String DoctorName =new String(request.getParameter("DoctorName"));
        String infoTel = request.getParameter("HospitalName");
            String name = "赵九";
            List<TDoctor> doctor = doctorService.findDoctorByName(name );
            request.setAttribute( "result",doctor );

            return "dangan";
        }

    @Autowired
    public SelectServiceByNameService selectServiceByNameService;
    @RequestMapping(value = "/chaxunFW", method = RequestMethod.GET)

    public String chart3(Model model,HttpServletRequest request, HttpServletResponse response ) throws UnsupportedEncodingException {
        setAuthorityAndUsername(model,request);
        request.setCharacterEncoding("UTF-8");
        String DoctorName =new String(request.getParameter("ServiceName"));
        String infoTel = request.getParameter("ServiceNumber");
        String name = "User";
        List<TService> ServiceResult = selectServiceByNameService.SelectServiceByName( name );
        request.setAttribute( "ServiceResult",ServiceResult );

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
