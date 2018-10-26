package com.yiyang.service.impl.social;

import com.yiyang.mapper.TPreserviceMapper;
import com.yiyang.pojo.TPreservice;
import com.yiyang.service.social.SelectPreserviceByNameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SelectPreserviceByNameServiceImpl implements SelectPreserviceByNameService {
    @Autowired
    public TPreserviceMapper tPreserviceMapper;
    @Override
    public List<TPreservice> selectPreserviceByName(String name) {
      List<TPreservice> result =  tPreserviceMapper.selectPreserviceByName( name );
        return result;
    }
}
