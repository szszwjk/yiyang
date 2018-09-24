package com.yiyang.service.controller;

import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.pojo.TServiceitem;
import com.yiyang.service.tservice.Serviceitem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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


}
