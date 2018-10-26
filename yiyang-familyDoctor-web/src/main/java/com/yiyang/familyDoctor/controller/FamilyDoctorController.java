package com.yiyang.familyDoctor.controller;

import com.yiyang.common.utils.JsonUtils;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.TConsult;
import com.yiyang.pojo.TDoctor;
import com.yiyang.pojo.TDsuggest;
import com.yiyang.pojo.TPreremind;
import com.yiyang.service.doctor.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class FamilyDoctorController {
    @Autowired
    DoctorService doctorService;

    @RequestMapping("/")
    @ResponseBody
    public ModelAndView index()
    {
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
    public ModelAndView consult()
    {
        ModelAndView modelAndView = new ModelAndView();
        List<TConsult> list= doctorService.getConsult("szszwjk123");
        modelAndView.addObject("conList",list);
        modelAndView.addObject("listjson", JsonUtils.objectToJson(list));
        // 视图
        modelAndView.setViewName("consult");
        return modelAndView;
    }
    @RequestMapping("/evaluate")
    @ResponseBody
    public ModelAndView evaluate()
    {
        ModelAndView modelAndView = new ModelAndView();
        List<TDsuggest> list= doctorService.getSuggest("张三");
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

}
