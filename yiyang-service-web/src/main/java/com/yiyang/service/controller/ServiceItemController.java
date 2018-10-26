package com.yiyang.service.controller;

import com.alibaba.dubbo.remoting.exchange.Request;
import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.TServiceitem;
import com.yiyang.service.tservice.Serviceitem;
import org.apache.http.HttpRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ServiceItemController {
    @Autowired
    private Serviceitem serviceitem;
    @RequestMapping("/item/serviceitem")
    @ResponseBody
    public YiyangPageResult getTpreservicedcl(Integer page, Integer rows, TServiceitem tServiceitem){

        if(tServiceitem.getSiLarge().equals("")&&tServiceitem.getSiLittle().equals("")){
            YiyangPageResult result=serviceitem.getServiceItem(page,rows);
            return  result;
        }else {
            if(tServiceitem.getSiLarge().equals("")){
                tServiceitem.setSiLarge(null);
            }if(tServiceitem.getSiLittle().equals("")){
                tServiceitem.setSiLittle(null);
            }
            YiyangPageResult result=serviceitem.getByLargeAndlittle(page,rows,tServiceitem);
            return result;
        }
    }
    @RequestMapping("/item/desc1")
    @ResponseBody
    public TServiceitem findBySiId(String siId,Model model){
        int siId1=Integer.parseInt(siId);
        System.out.println(siId);
        TServiceitem tServiceitem=serviceitem.fingBySiId(siId1);
        System.out.println(tServiceitem);
       /* model.addAttribute("tServiceitem",tServiceitem);*/
        return tServiceitem;
    }

  @RequestMapping(value = "/item/add",method = RequestMethod.POST)
    public String insert(TServiceitem tServiceitem){
       tServiceitem.setSiUser("zsss");
      tServiceitem.setSiName("222");
        System.out.println(tServiceitem);
        serviceitem.insertServiceItem(tServiceitem);
        return "serviceitem";
    }

    @RequestMapping(value="/item/saveupdate",method = RequestMethod.POST)
    @ResponseBody
    public YiyangResult update(TServiceitem tServiceitem){
        System.out.println("aaa"+tServiceitem);
        serviceitem.updateServiceItem(tServiceitem);
        return YiyangResult.ok();
    }

    @RequestMapping(value = "/item/shanchu",method = RequestMethod.POST)
    public String deleteBySiId(HttpServletRequest request,String siId){
        siId=request.getParameter("siId");
        int siId1=Integer.parseInt(siId);
        System.out.println(siId1);
        serviceitem.deleteBySiId(siId1);
        return "serviceitem";
    }



}
