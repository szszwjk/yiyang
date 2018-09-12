package com.yiyang.service.impl.user;

import com.yiyang.mapper.TLocalinfoMapper;
import com.yiyang.pojo.TLocalinfo;

import com.yiyang.service.user.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public  class LocationServiceImpl implements LocationService {
@Autowired
private TLocalinfoMapper tLocalinfoMapper;

    @Override
    public void insertLocation(TLocalinfo tLocalinfo) {
        tLocalinfoMapper.insertLocation(tLocalinfo );
    }

    @Override
    public void findLocationByUser(String userName) {

    }
}

