package com.yiyang.parent.controller;

import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.*;
import com.yiyang.service.parent.ParentData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ParentDataController {
    @Autowired
    private ParentData parentData;
    @RequestMapping("/parent/neartime")
    @ResponseBody
    public List<TData> selectDataByWeekOrMonth(int time,String flag)
    {

        List<TData> list = parentData.selectDataByWeekOrMonth(time, flag, "szszwjk");

        return list;
    }
    @RequestMapping("/parent/betweenTime")
    @ResponseBody
    public List<TData> selectDataBetweenTime(TData tData)
    {//从redis里获取用户名
        tData.setDaUser("szszwjk");
        List<TData> result=new ArrayList<TData>();

        if(tData.getStartTime()==null)
        {
            if(tData.getEndTime()==null)
            {
                 result = parentData.selectDataByWeekOrMonth(7, tData.getDaItem(), "szszwjk");

            }
            else{
                 result = parentData.selectDataSubWeek(tData);

            }
        }
        else {
            if(tData.getEndTime()==null){
                 result = parentData.selectDataAddWeek(tData);

            }
            else {
                 result = parentData.selectDataBetween(tData);

            }
        }

        return result;
    }
    @RequestMapping("/parent/updateoption")
    @ResponseBody
    public YiyangResult updateOption(TPreoption tPreoption)

    {
        System.out.println(tPreoption.getPoMax()+" "+tPreoption.getPoMin());
        try {
            parentData.updatePreoption(tPreoption);
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }

        return YiyangResult.ok();
    }
    @RequestMapping("/parent/addoption")
    @ResponseBody
    public YiyangResult addOption(TPreoption tPreoption)
    {
        tPreoption.setPoUser("szszwjk");
        boolean flag = parentData.getTpreoptionByItem(tPreoption);
        if(flag)
        {
            try {
                parentData.insertPreoption(tPreoption);
            } catch (Exception e) {
                e.printStackTrace();
                return YiyangResult.build(500,"服务器异常");
            }
            return YiyangResult.ok();
        }
        return YiyangResult.build(500,"此项目已存在，无需再次添加");
    }
    @RequestMapping("/parent/preremind")
    @ResponseBody
    public YiyangPageResult getTPreremind(Integer page, Integer rows,TPreremind tPreremind)
    {
        tPreremind.setPrUser("szszwjk");
        YiyangPageResult result = parentData.getTPreremind(page, rows, tPreremind);

        return result;
    }
    @RequestMapping("/parent/updateflag")
    @ResponseBody
    public YiyangResult updateFlag(TPreremind tPreremind){
        tPreremind.setPrFlag("2");
        parentData.updateFlag(tPreremind);
        return YiyangResult.ok();
    }
    //手术记录start
    @RequestMapping("/parent/getoperation")
    @ResponseBody
    public YiyangPageResult getOperation(Integer page,Integer rows, TOperation tOperation)
    {
        tOperation.setOpUser("szszwjk");
        YiyangPageResult result = parentData.getTOperation(page, rows, tOperation);
        return result;
    }
    @RequestMapping("/parent/saveOperation")
    @ResponseBody
    public YiyangResult saveOperation(TOperation tOperation)
    {
        tOperation.setOpUser("szszwjk");
        YiyangResult yiyangResult = parentData.addOperation(tOperation);
        return yiyangResult;
    }
    @RequestMapping("/parent/editOperation")
    @ResponseBody
    public YiyangResult editOperation(TOperation tOperation)
    {
        YiyangResult yiyangResult = parentData.editOperation(tOperation);
        return yiyangResult;
    }
    @RequestMapping("/parent/deleteoperation")
    @ResponseBody
    public YiyangResult deleteOperation(int opId)
    {
        YiyangResult yiyangResult = parentData.deleteOperation(opId);
        return yiyangResult;
    }
    //手术记录end

    //住院记录操作 start
    @RequestMapping("/parent/getmedical")
    @ResponseBody
    public YiyangPageResult getTMedical(Integer page,Integer rows,  TMedical tMedical)
    {
        tMedical.setmUser("szszwjk");
        YiyangPageResult result = parentData.getTMedical(page, rows, tMedical);
        return result;
    }

    @RequestMapping("/parent/savemedical")
    @ResponseBody
    public YiyangResult saveMedical(TMedical tMedical)
    {
        tMedical.setmUser("szszwjk");
        YiyangResult yiyangResult = parentData.addTMedical(tMedical);
        return yiyangResult;
    }
    @RequestMapping("/parent/editmedical")
    @ResponseBody
    public YiyangResult editMedical(TMedical tMedical)
    {
        YiyangResult yiyangResult = parentData.editTMedical(tMedical);
        return yiyangResult;
    }

    @RequestMapping("/parent/deletemedical")
    @ResponseBody
    public YiyangResult deleteMedical(int mId)
    {
        YiyangResult yiyangResult = parentData.deleteTMedical(mId);
        return yiyangResult;
    }
    //住院操作end

    //检查记录start
    @RequestMapping("/parent/getinspection")
    @ResponseBody
    public YiyangPageResult getInspection(Integer page,Integer rows,TInspection tInspection)

    {
        tInspection.setiUser("szszwjk");
        YiyangPageResult result = parentData.getTInspection(page, rows, tInspection);
        return result;
    }
    @RequestMapping("/parent/saveinspection")
    @ResponseBody
    public YiyangResult saveInspection(TInspection tInspection)
    {
        tInspection.setiUser("szszwjk");
        YiyangResult yiyangResult = parentData.addTInspection(tInspection);
        return yiyangResult;
    }
    @RequestMapping("/parent/editinspection")
    @ResponseBody
    public YiyangResult editInspection(TInspection tInspection)
    {
        YiyangResult yiyangResult = parentData.editTInspection(tInspection);
        return yiyangResult;
    }

    @RequestMapping("/parent/deleteinspection")
    @ResponseBody
    public YiyangResult deleteInspection(int iId)
    {
        YiyangResult yiyangResult = parentData.deleteTInspection(iId);
        return yiyangResult;
    }
    @RequestMapping("/parent/getsuggest")
    @ResponseBody
    public YiyangPageResult getTDsuggest(Integer page,Integer rows)

    {

        YiyangPageResult result = parentData.getTDsuggest(page, rows, "szszwjk");
        return result;
    }
    @RequestMapping("/parent/getdoctor")
    @ResponseBody
    public List<TDoctor> getDoctor(String dname)

    {

        List<TDoctor> result = parentData.getDoctor(dname);
        return result;
    }
}
