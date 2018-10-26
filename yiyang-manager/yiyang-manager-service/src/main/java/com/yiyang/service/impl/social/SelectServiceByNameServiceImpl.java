package com.yiyang.service.impl.social;

import com.yiyang.mapper.TServiceMapper;
import com.yiyang.pojo.TService;
import com.yiyang.service.social.SelectServiceByNameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;
@Service
public class SelectServiceByNameServiceImpl implements SelectServiceByNameService {
    @Autowired
    public TServiceMapper tServiceMapper;
    @Override
    public List<TService> SelectServiceByName(String name) {
      List<TService> result =  tServiceMapper.selectServiceByName( name );
        return result;
    }
}
