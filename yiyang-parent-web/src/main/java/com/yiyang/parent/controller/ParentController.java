package com.yiyang.parent.controller;

import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.pojo.TServiceitem;
import com.yiyang.service.parent.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ParentController {
    @Autowired
    private ParentService parentService;
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
    @RequestMapping("/")
    public String index()
    {
        return "parentservice";
    }
}
