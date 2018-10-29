package com.yiyang.familyDoctor.controller;

import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.CookieUtils;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.*;
import com.yiyang.service.doctor.DoctorService;
import com.yiyang.service.yunadmin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class FamilyDoctorController {
    @Autowired
    DoctorService doctorService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private JedisClient jedisClient;

    @RequestMapping("/")
    @ResponseBody
    public ModelAndView index(Model model, HttpServletRequest request)
    {
        setAuthorityAndUsername(model,request);
        TDoctor tDoctor= doctorService.findDoctorByName1("szszwjk123");
        List<TPreremind> list= doctorService.getPreremind("szszwjk123");
        System.out.print(list.size());
        ModelAndView modelAndView = new ModelAndView();
        // 填充数据
        modelAndView.addObject("doctor",tDoctor);
        modelAndView.addObject("prList",list);
        // 视图
        modelAndView.setViewName("index");
        return modelAndView;
    }
    @RequestMapping("/consult")
    @ResponseBody
    public ModelAndView consult(Model model, HttpServletRequest request)
    {
        setAuthorityAndUsername(model,request);
        ModelAndView modelAndView = new ModelAndView();
        List<TConsult> list= doctorService.getConsult("szszwjk3");
        modelAndView.addObject("conList",list);
        modelAndView.addObject("listjson", JsonUtils.objectToJson(list));
        // 视图
        modelAndView.setViewName("consult");
        return modelAndView;
    }
    @RequestMapping("/evaluate")
    @ResponseBody
    public ModelAndView evaluate(Model model, HttpServletRequest request)
    {
        setAuthorityAndUsername(model,request);
        ModelAndView modelAndView = new ModelAndView();
        List<TDsuggest> list= doctorService.getSuggest("szszwjk");
        modelAndView.addObject("evaList",list);
        // 视图
        modelAndView.setViewName("evaluate");
        return modelAndView;
    }
    @RequestMapping("/doctor/addSuggest")
    @ResponseBody
    public YiyangResult addSuggest(TDsuggest tDsuggest)
    {
      YiyangResult yiyangResult= doctorService.insertSuggest(tDsuggest);
        return yiyangResult;
    }
    @RequestMapping("/doctor/saveanswer")
    @ResponseBody
    public YiyangResult saveanswer(TConsult tConsult)
    {
        System.out.println(tConsult.getcId());
       YiyangResult yiyangResult= doctorService.updateConsult(tConsult);
        return yiyangResult;
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
