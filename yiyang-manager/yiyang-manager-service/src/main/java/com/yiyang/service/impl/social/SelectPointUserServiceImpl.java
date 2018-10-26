package com.yiyang.service.impl.social;

import com.yiyang.mapper.TUserInfoMapper;
import com.yiyang.pojo.TUserInfo;
import com.yiyang.service.social.SelectPointUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SelectPointUserServiceImpl implements SelectPointUserService {
    @Autowired
   public  TUserInfoMapper tUserInfoMapper;
    @Override
    public List<TUserInfo> SelectPointUser(String infoName, String infoTel) {
        List<TUserInfo> tUserInfos = tUserInfoMapper.SelectPointUser( infoName, infoTel );
        return tUserInfos;
    }
}
