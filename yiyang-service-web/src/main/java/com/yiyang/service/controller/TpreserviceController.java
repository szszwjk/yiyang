package com.yiyang.service.controller;

import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.TPreservice;
import com.yiyang.service.tservice.TpreService;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class TpreserviceController {

    @Autowired
    private TpreService tpreService;
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
    public String index(){
        return "index";
    }

    @RequestMapping("/serviceitem")
    public String serviceitem(){
        return "serviceitem";
    }

    @RequestMapping("/preservice")
    public String preservice(){
        return "preservice";
    }
    @RequestMapping("/serviceinfo")
    public String serviceinfo(){
        return "serviceinfo";
    }


    @RequestMapping(value="/jieshou",method=RequestMethod.GET)
    public ModelAndView jieshou(String psNumber){
        psNumber="002";
        TPreservice tPreservice=tpreService.findByPsNumber(psNumber);
        System.out.println(tPreservice);
        ModelAndView mv=new ModelAndView();
        mv.addObject("tPreservice",tPreservice);
        return mv;
    }
    @RequestMapping("/index")
     public String index1(){
    return "index";
}

}
