package com.yiyang.service.impl.user;

import com.yiyang.mapper.TLocalinfoMapper;
import com.yiyang.mapper.TUserMapper;
import com.yiyang.pojo.TLocalinfo;
import com.yiyang.pojo.TUser;

import com.yiyang.service.user.locationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public  class LocationServiceImpl implements locationService {
@Autowired
private TLocalinfoMapper tLocalinfoMapper;

    @Override
    public void insertLocation(TLocalinfo tLocalinfo) {
        tLocalinfoMapper.insertLocation(tLocalinfo );
    }
}

