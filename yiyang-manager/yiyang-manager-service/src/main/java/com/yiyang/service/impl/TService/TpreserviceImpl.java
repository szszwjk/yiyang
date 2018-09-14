package com.yiyang.service.impl.TService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yiyang.common.utils.EasyUIDataGridResult;
import com.yiyang.mapper.TPreserviceMapper;
import com.yiyang.pojo.TPreservice;
import com.yiyang.service.tservice.Tpreservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import java.util.List;
@Service
public class TpreserviceImpl  implements Tpreservice {

    @Autowired
    private TPreserviceMapper tPreserviceMapper;
    @Override
    public EasyUIDataGridResult getTPreservice(int page, int rows) {
        //设置分页信息
        PageHelper.startPage(page, rows);
        //得到所有工单信息
        List<TPreservice> list=tPreserviceMapper.findAll();
        //取分页信息
        PageInfo<TPreservice> pageInfo = new PageInfo<TPreservice>(list);
        //创建返回结果对象
        EasyUIDataGridResult result = new EasyUIDataGridResult();
        result.setTotal(pageInfo.getTotal());
        result.setRows(list);
        return result;
    }
}
