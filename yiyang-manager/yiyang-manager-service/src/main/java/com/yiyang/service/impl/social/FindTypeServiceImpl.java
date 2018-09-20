package com.yiyang.service.impl.social;

import com.yiyang.mapper.TPreserviceMapper;
import com.yiyang.service.social.FindTypeService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FindTypeServiceImpl implements FindTypeService {
    @Autowired
    TPreserviceMapper tPreserviceMapper;
    @Override
    public int findType(int type) {
     int i =   tPreserviceMapper.findType( type );
     return i;
    }
}
