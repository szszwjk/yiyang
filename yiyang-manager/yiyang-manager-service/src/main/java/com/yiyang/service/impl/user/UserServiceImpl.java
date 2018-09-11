package com.yiyang.service.impl.user;

import com.yiyang.mapper.TUserMapper;
import com.yiyang.pojo.TUser;
import com.yiyang.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private TUserMapper tUserMapper;
    @Override
    public void registerUser(TUser tUser) {
       tUserMapper.insertUser(tUser);


    }
}
