package com.yiyang.service.impl.TService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.mapper.TServiceitemMapper;
import com.yiyang.pojo.TServiceitem;
import com.yiyang.service.tservice.Serviceitem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceitemImpl implements  Serviceitem{
    @Autowired
    private TServiceitemMapper tServiceitemMapper;

    @Override
    public YiyangPageResult getServiceItem(int page, int rows) {
        //设置分页信息
        PageHelper.startPage(page, rows);
        //得到所有工单信息
        //tPreservice=new TPreservice();
        //tPreservice.setPsUname(name);
        // tPreservice.setPsTelnumber(phone);
        List<TServiceitem> list=tServiceitemMapper.selectAll();
         //取分页信息
        PageInfo<TServiceitem> pageInfo = new PageInfo<>(list);
        //创建返回结果对象
        YiyangPageResult result = new YiyangPageResult();
        result.setTotal(pageInfo.getTotal());
        result.setRows(list);
        return result;
    }

    @Override
    public YiyangPageResult getByLargeAndlittle(int page, int rows, TServiceitem tServiceitem) {
        //设置分页信息
        PageHelper.startPage(page, rows);
        //得到所有工单信息
        //tPreservice=new TPreservice();
        //tPreservice.setPsUname(name);
        // tPreservice.setPsTelnumber(phone);
        List<TServiceitem> list=tServiceitemMapper.selectByLargeAndLittle(tServiceitem);
        //取分页信息
        PageInfo<TServiceitem> pageInfo = new PageInfo<>(list);
        //创建返回结果对象
        YiyangPageResult result = new YiyangPageResult();
        result.setTotal(pageInfo.getTotal());
        result.setRows(list);
        return result;
    }
}
