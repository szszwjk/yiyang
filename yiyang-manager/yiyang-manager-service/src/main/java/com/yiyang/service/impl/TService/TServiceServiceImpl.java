package com.yiyang.service.impl.TService;

import com.yiyang.mapper.TServiceMapper;

import com.yiyang.pojo.TService;
import com.yiyang.service.tservice.TServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TServiceServiceImpl implements TServiceService {
   /* @Autowired
    private TServiceMapper tServiceMapper;

    @Override
    public void addTService(TService tService) {
       tServiceMapper.insertTService(tService);
    }

    @Override
    public TService getTServiceByUser(String sUser) {
        TService tService=tServiceMapper.findTServiceByUser(sUser);
        System.out.println(sUser);
        System.out.println(tService);
        return tService;
    }

    @Override
    public void updateTService(TService tService) {
        TService tService1=new TService();
        tService1.setsName(tService.getsName());
        tService1.setsNumber(tService.getsNumber());
        tService1.setsCnum(tService.getsCnum());
        tService1.setsDescribe(tService.getsDescribe());
        tService1.setsInfo2(tService.getsInfo2());
        tService1.setsInfo3(tService.getsInfo3());
        tService1.setsAddress(tService.getsAddress());
        tService1.setsFlag(tService.getsFlag());
        tService.setsUser(tService.getsUser());
        tServiceMapper.updateTService(tService1);
    }*/
}
