package com.yiyang.service.impl.TService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.mapper.TPreserviceMapper;
import com.yiyang.pojo.TPreservice;

import com.yiyang.service.tservice.TpreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class TpreServiceImpl implements TpreService {

    @Autowired
    private TPreserviceMapper tPreserviceMapper;

    @Override
    public YiyangPageResult getTpreService(int page, int rows) {
        //设置分页信息
        PageHelper.startPage(page, rows);
        //得到所有工单信息
        List<TPreservice> list=tPreserviceMapper.findAll();
        //取分页信息
        PageInfo<TPreservice> pageInfo = new PageInfo<>(list);
        //创建返回结果对象
        YiyangPageResult result = new YiyangPageResult();
        result.setTotal(pageInfo.getTotal());
        result.setRows(list);
        return result;
    }



}
