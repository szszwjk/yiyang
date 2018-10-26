package com.yiyang.service.impl.social;

import com.yiyang.mapper.TParentMapper;
import com.yiyang.pojo.TParent;
import com.yiyang.service.social.SelectUserByIdnumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SelectUserByIdnumServiceImpl implements SelectUserByIdnumService {
    @Autowired
    public TParentMapper tParentMapper;
    @Override
    public TParent SelectUserByIdnum(String Idnum) {
        TParent tParent = tParentMapper.SelectUserByIdnum( Idnum );
        return tParent;
    }
}
