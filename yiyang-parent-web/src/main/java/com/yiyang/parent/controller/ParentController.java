package com.yiyang.parent.controller;

import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.*;
import com.yiyang.service.parent.ParentData;
import com.yiyang.service.parent.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class ParentController {
    @Autowired
    private ParentService parentService;
    @Autowired
    private ParentData parentData;
    @RequestMapping("/item/list")
    @ResponseBody
    public YiyangPageResult getItemList(Integer page, Integer rows, TServiceitem tServiceitem) {
        System.out.println(tServiceitem);
        if(tServiceitem.getSiLarge().equals("")&&tServiceitem.getSiLittle().equals(""))
        {
            YiyangPageResult result = parentService.getTserviceItem(page,rows);
            return result;
        }
        else {
            if (tServiceitem.getSiLarge().equals("")){
                tServiceitem.setSiLarge(null);
            }
            if(tServiceitem.getSiLittle().equals("")){
                tServiceitem.setSiLittle(null);
            }
            YiyangPageResult result = parentService.getItemByLargeAndLittle(page, rows, tServiceitem);
            return result;
        }
    }
    @RequestMapping("/item/desc")
    @ResponseBody
    public ServiceDesc getServiceDesc(String itemId) {
        ServiceDesc desc = parentService.getServicesDesc(itemId);
        return desc;
    }
    ///parent/preservice
    @RequestMapping("parent/preservice")
    @ResponseBody
    public ServiceDesc preService(String itemId) {
        ServiceDesc desc = parentService.preServices(itemId);
        System.out.println(desc);
        return desc;
    }
    @RequestMapping("parent/order")
    @ResponseBody
    public YiyangResult serviceOrder(TPreservice tPreservice) {

        Date date=new Date();
        tPreservice.setPsTime(date);
        String uuid = UUID.randomUUID().toString().substring(15);
        String id = uuid.replace("-", "");
        tPreservice.setPsNumber(id);
        //完成是要从redis里提取 start
        tPreservice.setPsUser("szszwjk");
        //end
        tPreservice.setPsFlag("1");
        YiyangResult result = parentService.serviceOrder(tPreservice);

        return result;
    }
    ///parent/hservice
    @RequestMapping("/parent/hservice")
    @ResponseBody
    public YiyangPageResult hServices(Integer page, Integer rows, TPreservice tPreservice) {
        //完成是要从redis里提取 start
        tPreservice.setPsUser("szszwjk");
        //end
        System.out.println(tPreservice);
        if(tPreservice.getPsNumber().equals("")&&tPreservice.getPsItem().equals(""))
        {
            YiyangPageResult result = parentService.getHServices(page, rows, tPreservice);
            return result;
        }
        else {
            if (tPreservice.getPsNumber().equals("")){
                tPreservice.setPsNumber(null);
            }
            if(tPreservice.getPsItem().equals("")){
                tPreservice.setPsItem(null);
            }
            YiyangPageResult result = parentService.getHServices(page, rows, tPreservice);
            System.out.println(result);
            return result;
        }
    }
    ///parent/hservicelist
    @RequestMapping("/parent/hservicelist")
    @ResponseBody
    public HServiceList getHServiceList(TPreservice tPreservice) {
        System.out.println(tPreservice);
        //完成是要从redis里提取 start
        tPreservice.setPsUser("szszwjk");
        //end
        HServiceList result = parentService.getHServiceList(tPreservice);
        System.out.println(result);
        return result;


    }
    @RequestMapping("/parent/saveparent")
    @ResponseBody
    public YiyangResult saveParent(TParent tParent)
    {
        tParent.gettUserInfo().setInfoMarriage(tParent.gettUserInfo().getInfoMarriage().equals("已婚")?"1":"0");
        //完成是要从redis里提取 start
        tParent.setpUser("szszwjk");
        tParent.gettUserInfo().setInfoUser("szszwjk");
        //end
        YiyangResult yiyangResult = parentService.updateParent(tParent);

        return yiyangResult;
    }
    @RequestMapping("/parent/updatepass")
    @ResponseBody
    public YiyangResult updatePass(TUser tUser)
    {
        tUser.setUsername("szszwjk");
        YiyangResult result = parentService.updatePass(tUser);
        return result;
    }
    @RequestMapping("/parent/addconsult")
    @ResponseBody
    public YiyangResult addConsult(TConsult tConsult)
    {
        tConsult.setcUser("szszwjk");
        tConsult.setcFlag("1");
        tConsult.setcDate(new Date());
        YiyangResult yiyangResult = parentService.addConsult(tConsult);
        return yiyangResult;
    }
    @RequestMapping("/parent/getconsult")
    @ResponseBody
    public YiyangPageResult getConsult(Integer page, Integer rows,TConsult tConsult)
    {
        tConsult.setcUser("szszwjk");

        YiyangPageResult res = parentService.getConsult(page, rows, tConsult);
        return res;
    }


}
