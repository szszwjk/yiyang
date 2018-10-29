package com.yiyang.service.controller;

import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.CookieUtils;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.TPreservice;
import com.yiyang.pojo.TService;
import com.yiyang.pojo.TUser;
import com.yiyang.pojo.UserAuthorityKey;
import com.yiyang.service.tservice.TpreService;

import com.yiyang.service.tservice.Tservice;
import com.yiyang.service.yunadmin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TpreserviceController {

    @Autowired
    private TpreService tpreService;
    @Autowired
    private Tservice tservice;
    @Autowired
    private AdminService adminService;
    @Autowired
    private JedisClient jedisClient;
    @RequestMapping("/item/dcllist")
    @ResponseBody
    public YiyangPageResult getTpreservicedcl(Integer page, Integer rows,TPreservice tPreservice){

        if(tPreservice.getPsUname().equals("")&&tPreservice.getPsTelnumber().equals("")){
            YiyangPageResult result=tpreService.getTpreServicedcl(page,rows);
            return  result;
        }else {
            if(tPreservice.getPsUname().equals("")){
                tPreservice.setPsUname(null);
            }if(tPreservice.getPsTelnumber().equals("")){
                tPreservice.setPsTelnumber(null);
            }
            YiyangPageResult result=tpreService.getByUnameAndTeldcl(page,rows,tPreservice);
                return result;
        }
    }
    @RequestMapping("/item/yjdlist")
    @ResponseBody
    public YiyangPageResult getTpreserviceyjd(Integer page, Integer rows,TPreservice tPreservice){

        if(tPreservice.getPsUname().equals("")&&tPreservice.getPsTelnumber().equals("")){
            YiyangPageResult result=tpreService.getTpreServiceyjd(page,rows);
            return  result;
        }else {
            if(tPreservice.getPsUname().equals("")){
                tPreservice.setPsUname(null);
            }if(tPreservice.getPsTelnumber().equals("")){
                tPreservice.setPsTelnumber(null);
            }
            YiyangPageResult result=tpreService.getByUnameAndTelyjd(page,rows,tPreservice);
            return result;
        }
    }
    @RequestMapping("/item/ywclist")
    @ResponseBody
    public YiyangPageResult getTpreserviceywc(Integer page, Integer rows,TPreservice tPreservice){

        if(tPreservice.getPsUname().equals("")&&tPreservice.getPsTelnumber().equals("")){
            YiyangPageResult result=tpreService.getTpreServiceywc(page,rows);
            return  result;
        }else {
            if(tPreservice.getPsUname().equals("")){
                tPreservice.setPsUname(null);
            }if(tPreservice.getPsTelnumber().equals("")){
                tPreservice.setPsTelnumber(null);
            }
            YiyangPageResult result=tpreService.getByUnameAndTelywc(page,rows,tPreservice);
            return result;
        }
    }
    @RequestMapping("/show/dcl")
    @ResponseBody
    public TPreservice getInfoByPsNumber(String psNumber){
        TPreservice tPreservice=tpreService.findByPsNumber(psNumber);
        return tPreservice;
    }

    @RequestMapping("/")
    public ModelAndView index(Model model, HttpServletRequest request){
        setAuthorityAndUsername(model,request);
        String sUser="zs1";
        TService tService=tservice.findInfoByUser(sUser);
        System.out.println(tService);
        ModelAndView mv=new ModelAndView();
        mv.addObject("tService",tService);
        mv.setViewName("index");
        return mv;
    }

   @RequestMapping("/serviceitem")
    public String serviceitem(Model model, HttpServletRequest request){
       setAuthorityAndUsername(model,request);
        return "serviceitem";
    }

    @RequestMapping("/preservice")
    public String preservice(Model model, HttpServletRequest request){
        setAuthorityAndUsername(model,request);
        return "preservice";
    }

   /* @RequestMapping("/serviceinfo")
    public String serviceinfo(){
        return "serviceinfo";
    }*/
    @RequestMapping("/jieshou/{psNumber}")
    public String jieshou(@PathVariable String psNumber,Model model, HttpServletRequest request){
        setAuthorityAndUsername(model,request);
       System.out.println(psNumber);
        TPreservice  tPreservice=tpreService.findByPsNumber(psNumber);
        System.out.println(tPreservice);
        model.addAttribute("tPreservice",tPreservice);
        return "jieshou";
    }
    @RequestMapping(value = "/jieshou/",method = RequestMethod.POST)
    public String jieshou1(@RequestParam String psNumber,Model model, HttpServletRequest request){
        setAuthorityAndUsername(model,request);
        System.out.println(psNumber);
        tpreService.updateFlag2(psNumber);
        TPreservice tPreservice=tpreService.findByPsNumber(psNumber);
        System.out.println(tpreService);
        return "jieshou";
    }
    @RequestMapping("/chuli/{psNumber}")
    public String chuli(@PathVariable String psNumber,Model model, HttpServletRequest request){
        setAuthorityAndUsername(model,request);
        TPreservice tPreservice=tpreService.findByPsNumber(psNumber);
        System.out.println(tPreservice);
        model.addAttribute("tPreservice",tPreservice);
        return "chuli";
    }
    @RequestMapping(value = "/chuli/",method = RequestMethod.POST)
    public String chuli1(@RequestParam String psNumber,Model model, HttpServletRequest request){
        setAuthorityAndUsername(model,request);
        tpreService.updateFlag3(psNumber);
        TPreservice tPreservice =tpreService.findByPsNumber(psNumber);
        System.out.println(tpreService);
        return "chuli";
    }
    @RequestMapping("/show/{psNumber}")
    public String show(@PathVariable String psNumber,Model model, HttpServletRequest request){
        setAuthorityAndUsername(model,request);
        TPreservice tPreservice=tpreService.findByPsNumber(psNumber);
       System.out.println(tPreservice);
        model.addAttribute("tPreservice",tPreservice);
        return "show";
    }
   /* @RequestMapping("/index")
     public String index1(){
    return "index";
}*/

    @RequestMapping(value = "/item/refuse",method = RequestMethod.POST)
    public String refuse(@RequestParam String psNumber,Model model, HttpServletRequest request){
        setAuthorityAndUsername(model,request);
        System.out.println(psNumber);
        tpreService.updateFlag4(psNumber);
        return "preservice";
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
