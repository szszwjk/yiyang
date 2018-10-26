package com.yiyang.service.impl.social;

import com.yiyang.mapper.TServiceMapper;
import com.yiyang.pojo.TService;
import com.yiyang.service.social.SelectAllServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SelectAllServiceServiceImpl implements SelectAllServiceService {
    @Autowired
    private TServiceMapper tServiceMapper;
    @Override
    public List<TService> SelectAllService() {
      List<TService> result =  tServiceMapper.selectAllService();
        return result;
    }
}
