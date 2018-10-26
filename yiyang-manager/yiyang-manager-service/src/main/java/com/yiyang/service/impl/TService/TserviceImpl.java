package com.yiyang.service.impl.TService;

import com.yiyang.common.utils.YiyangResult;
import com.yiyang.mapper.TServiceMapper;
import com.yiyang.pojo.TService;
import com.yiyang.service.tservice.Tservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TserviceImpl implements Tservice {
    @Autowired
    private TServiceMapper tServiceMapper;
    @Override
    public TService findInfoByUser(String sUser) {
        TService tService= tServiceMapper.findInfoByUser(sUser);
        return tService;
    }

    @Override
    public YiyangResult updateByUser(TService tService) {
        tServiceMapper.updateByUser(tService);
        return YiyangResult.ok();
    }
}
