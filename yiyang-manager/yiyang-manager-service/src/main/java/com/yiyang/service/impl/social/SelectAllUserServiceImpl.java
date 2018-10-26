package com.yiyang.service.impl.social;

import com.yiyang.mapper.TUserInfoMapper;
import com.yiyang.pojo.TUserInfo;
import com.yiyang.service.social.SelectAllUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class SelectAllUserServiceImpl implements SelectAllUserService {
    @Autowired
    public TUserInfoMapper tUserInfoMapper;


    @Override
    public List< TUserInfo > SelectAllUser() {

       List<TUserInfo> list =  tUserInfoMapper.SelectAllUser();

        return  list;
    }
}
