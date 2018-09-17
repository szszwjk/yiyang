package com.yiyang.service.impl.parent;

import com.yiyang.mapper.TServiceitemMapper;
import com.yiyang.pojo.TServiceitem;
import com.yiyang.service.parent.ServiceItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceItemImpl implements ServiceItem{
    @Autowired
    private TServiceitemMapper tServiceitemMapper;
    @Override
    public void insertItem(TServiceitem tServiceitem) {
        tServiceitemMapper.insertServiceItem(tServiceitem);
    }
}
