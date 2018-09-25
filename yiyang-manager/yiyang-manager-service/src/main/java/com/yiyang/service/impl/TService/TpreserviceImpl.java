package com.yiyang.service.impl.TService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.mapper.TPreserviceMapper;
import com.yiyang.pojo.TPreservice;

import com.yiyang.service.tservice.TpreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TpreServiceImpl implements TpreService {

//    @Autowired
//    private TPreserviceMapper tPreserviceMapper;
//
//    @Override
//    public YiyangPageResult getTpreServicedcl(int page, int rows) {
//        //设置分页信息
//        PageHelper.startPage(page, rows);
//        //得到所有工单信息
//        //tPreservice=new TPreservice();
//        //tPreservice.setPsUname(name);
//       // tPreservice.setPsTelnumber(phone);
//        List<TPreservice> list=tPreserviceMapper.findDCLAll();
//        //取分页信息
//        PageInfo<TPreservice> pageInfo = new PageInfo<>(list);
//        //创建返回结果对象
//        YiyangPageResult result = new YiyangPageResult();
//        result.setTotal(pageInfo.getTotal());
//        result.setRows(list);
//        return result;
//    }
//    @Override
//    public YiyangPageResult getByUnameAndTeldcl(int page, int rows, TPreservice tPreservice) {
//        //设置分页信息
//        PageHelper.startPage(page, rows);
//        //得到所有工单信息
//        //tPreservice=new TPreservice();
//        //tPreservice.setPsUname(name);
//        // tPreservice.setPsTelnumber(phone);
//        List<TPreservice> list=tPreserviceMapper.findDCL(tPreservice);
//        //取分页信息
//        PageInfo<TPreservice> pageInfo = new PageInfo<>(list);
//        //创建返回结果对象
//        YiyangPageResult result = new YiyangPageResult();
//        result.setTotal(pageInfo.getTotal());
//        result.setRows(list);
//        return result;
//    }
//
//    @Override
//    public YiyangPageResult getTpreServiceyjd(int page, int rows) {
//        //设置分页信息
//        PageHelper.startPage(page, rows);
//        //得到所有工单信息
//        //tPreservice=new TPreservice();
//        //tPreservice.setPsUname(name);
//        // tPreservice.setPsTelnumber(phone);
//        List<TPreservice> list=tPreserviceMapper.findYJDAll();
//        //取分页信息
//        PageInfo<TPreservice> pageInfo = new PageInfo<>(list);
//        //创建返回结果对象
//        YiyangPageResult result = new YiyangPageResult();
//        result.setTotal(pageInfo.getTotal());
//        result.setRows(list);
//        return result;
//    }
//    @Override
//    public YiyangPageResult getByUnameAndTelyjd(int page, int rows, TPreservice tPreservice) {
//        //设置分页信息
//        PageHelper.startPage(page, rows);
//        //得到所有工单信息
//        //tPreservice=new TPreservice();
//        //tPreservice.setPsUname(name);
//        // tPreservice.setPsTelnumber(phone);
//        List<TPreservice> list=tPreserviceMapper.findYJD(tPreservice);
//        //取分页信息
//        PageInfo<TPreservice> pageInfo = new PageInfo<>(list);
//        //创建返回结果对象
//        YiyangPageResult result = new YiyangPageResult();
//        result.setTotal(pageInfo.getTotal());
//        result.setRows(list);
//        return result;
//    }
//
//    @Override
//    public YiyangPageResult getTpreServiceywc(int page, int rows) {
//        //设置分页信息
//        PageHelper.startPage(page, rows);
//        //得到所有工单信息
//        //tPreservice=new TPreservice();
//        //tPreservice.setPsUname(name);
//        // tPreservice.setPsTelnumber(phone);
//        List<TPreservice> list=tPreserviceMapper.findYWCAll();
//        //取分页信息
//        PageInfo<TPreservice> pageInfo = new PageInfo<>(list);
//        //创建返回结果对象
//        YiyangPageResult result = new YiyangPageResult();
//        result.setTotal(pageInfo.getTotal());
//        result.setRows(list);
//        return result;
//    }
//    @Override
//    public YiyangPageResult getByUnameAndTelywc(int page, int rows, TPreservice tPreservice) {
//        //设置分页信息
//        PageHelper.startPage(page, rows);
//        //得到所有工单信息
//        //tPreservice=new TPreservice();
//        //tPreservice.setPsUname(name);
//        // tPreservice.setPsTelnumber(phone);
//        List<TPreservice> list=tPreserviceMapper.findYWC(tPreservice);
//        //取分页信息
//        PageInfo<TPreservice> pageInfo = new PageInfo<>(list);
//        //创建返回结果对象
//        YiyangPageResult result = new YiyangPageResult();
//        result.setTotal(pageInfo.getTotal());
//        result.setRows(list);
//        return result;
//    }
//
//    @Override
//    public TPreservice findByPsNumber(String psNumber) {
//        TPreservice tPreservice=tPreserviceMapper.findByPsNumber(psNumber);
//        return tPreservice;
//    }


}
