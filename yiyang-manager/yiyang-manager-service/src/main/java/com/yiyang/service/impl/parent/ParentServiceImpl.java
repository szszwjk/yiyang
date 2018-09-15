package com.yiyang.service.impl.parent;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.mapper.TServiceitemMapper;
import com.yiyang.pojo.TServiceitem;
import com.yiyang.service.parent.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ParentServiceImpl implements ParentService{
    @Autowired
    private TServiceitemMapper tServiceitemMapper;
    @Override
    public YiyangPageResult getTserviceItem(int page,int rows) {
    //设置分页信息
        PageHelper.startPage(page, rows);
        //执行查询
        List<TServiceitem> list = tServiceitemMapper.selectAll();
        //取分页信息
        PageInfo<TServiceitem> pageInfo = new PageInfo<>(list);

        //创建返回结果对象
        YiyangPageResult result = new YiyangPageResult();
        result.setTotal(pageInfo.getTotal());
        result.setRows(list);

        return result;
    }
}
