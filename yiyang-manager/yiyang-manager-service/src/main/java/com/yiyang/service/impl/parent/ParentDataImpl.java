package com.yiyang.service.impl.parent;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.mapper.*;
import com.yiyang.pojo.*;
import com.yiyang.service.parent.ParentData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Service
public class ParentDataImpl implements ParentData {

    @Autowired
    private TDataMapper tDataMapper;
    @Autowired
    private TPreoptionMapper tPreoptionMapper;
    @Autowired
    private TPreremindMapper tPreremindMapper;
    @Autowired
    private TOperationMapper tOperationMapper;
    @Autowired
    private TMedicalMapper tMedicalMapper;
    @Autowired
    private TInspectionMapper tInspectionMapper;
    @Autowired
    private TDsuggestMapper tDsuggestMapper;
    @Autowired
    private TParentMapper tParentMapper;
    @Autowired
    private UserAuthorityMapper userAuthorityMapper;
    @Override
    public List<TData> selectDataByWeekOrMonth(int flag, String item, String username) {
        List<TData> tData = tDataMapper.selectDataByWeekOrMonth(flag, item, username);
        return tData;
    }

    @Override
    public List<TData> selectDataAddWeek(TData tData) {
        List<TData> result = tDataMapper.selectDataAddWeek(tData);
        return result;
    }

    @Override
    public List<TData> selectDataSubWeek(TData tData) {
        List<TData> result = tDataMapper.selectDataSubWeek(tData);
        return result;
    }

    @Override
    public List<TData> selectDataBetween(TData tData) {
        List<TData> result = tDataMapper.selectDataBetween(tData);
        return result;
    }

    @Override
    public List<TPreoption> getTPreoptionforUsername(String username) {
        List<TPreoption> list = tPreoptionMapper.getTPreoptionforUsername(username);
        return list;
    }

    @Override
    public void insertPreoption(TPreoption tPreoption) {
        tPreoptionMapper.insertPreoption(tPreoption);
    }

    @Override
    public void updatePreoption(TPreoption tPreoption) {
        tPreoptionMapper.updatePreoption(tPreoption);
    }

    @Override
    public boolean getTpreoptionByItem(TPreoption tPreoption) {
        TPreoption item = tPreoptionMapper.getTpreoptionByItem(tPreoption);
        if(item==null)
        {
            return true;
        }
        return false;
    }

    @Override
    public YiyangPageResult getTPreremind(Integer page,Integer rows, TPreremind tPreremind) {
        PageHelper.startPage(page, rows);
        List<TPreremind> result = tPreremindMapper.getTPreremind(tPreremind);
        String time=null;
        SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(int i=0;i<result.size();i++)
        {
            result.get(i).setPrFlag(result.get(i).getPrFlag().equals("1")?"未处理":"已处理");
            switch ( result.get(i).getPrItem())
            {
                case "xt":result.get(i).setPrItem("血糖");break;
                case "xy":result.get(i).setPrItem("血氧");break;
                case "xl":result.get(i).setPrItem("心率");break;
            }
            time=format0.format(result.get(i).getPrTime());
            result.get(i).setPrUnit( time+"测量了"+result.get(i).getPrItem()+": "+result.get(i).getPrItem()+": "+result.get(i).getPrValue());
        }
        return getPage(result);

    }

    @Override
    public void updateFlag(TPreremind tPreremind) {
        tPreremindMapper.updateFlag(tPreremind);
    }
    //手术操作开始
    @Override
    public YiyangPageResult getTOperation(Integer page,Integer rows, TOperation tOperation) {


        PageHelper.startPage(page, rows);
        List<TOperation> result = tOperationMapper.getTOperation(tOperation);
        return getPage(result);
    }

    @Override
    public YiyangResult addOperation(TOperation tOperation) {
        try {
            tOperationMapper.addOperation(tOperation);
        } catch (Exception e) {
            e.printStackTrace();
            YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangResult editOperation(TOperation tOperation) {
        try {
            tOperationMapper.editOperation(tOperation);
        } catch (Exception e) {
            e.printStackTrace();
            YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangResult deleteOperation(int opId) {
        try {
            tOperationMapper.deleteOperation(opId);
        } catch (Exception e) {
            e.printStackTrace();
            YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }
    //end
    //住院操作start
    @Override
    public YiyangPageResult getTMedical(Integer page,Integer rows,TMedical tMedical) {

        PageHelper.startPage(page,rows);
        List<TMedical> result = tMedicalMapper.getTMedical(tMedical);

        return getPage(result);
    }

    @Override
    public YiyangResult addTMedical(TMedical tMedical) {
        try {
            tMedicalMapper.addTMedical(tMedical);
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangResult editTMedical(TMedical tMedical) {
        try {
            tMedicalMapper.editTMedical(tMedical);
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangResult deleteTMedical(int mId) {
        try {
            tMedicalMapper.deleteTMedical(mId);
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }
    //住院end
    //检验操作start
    @Override
    public YiyangPageResult getTInspection(Integer page, Integer rows, TInspection tInspection) {
        PageHelper.startPage(page,rows);
        List<TInspection> list = tInspectionMapper.getTInspection(tInspection);

        return getPage(list);
    }

    @Override
    public YiyangResult addTInspection(TInspection tInspection) {

        try {
            tInspectionMapper.addTInspection(tInspection);
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangResult editTInspection(TInspection tInspection) {
        try {
            tInspectionMapper.editTInspection(tInspection);
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangResult deleteTInspection(int iId) {
        try {
            tInspectionMapper.deleteTInspection(iId);
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangPageResult getTDsuggest(Integer page, Integer rows, String username) {
        PageHelper.startPage(page,rows);
        List<TDsuggest> result = this.tDsuggestMapper.getTDsuggestMapper(username);

        return getPage(result);
    }

    @Override
    public List<TDoctor> getDoctor(String dname) {
        List<TDoctor> result = tParentMapper.getDoctor(dname);
        return result;
    }

    @Override
    public List<TAuthority> getAuthorityByUser(String username) {
        List<TAuthority> authorityByUser = userAuthorityMapper.getAuthorityByUser(username);
        return authorityByUser;
    }

    //检验操作end
    public <T>YiyangPageResult getPage(List<T> list){

        PageInfo<T> pageInfo = new PageInfo<>(list);
        YiyangPageResult result = new YiyangPageResult();
        result.setTotal(pageInfo.getTotal());
        result.setRows(list);
        return result;
    }
}
