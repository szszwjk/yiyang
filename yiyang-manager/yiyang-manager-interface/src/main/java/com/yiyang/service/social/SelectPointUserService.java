package com.yiyang.service.social;

import com.yiyang.pojo.TUserInfo;

import java.util.List;

public interface SelectPointUserService {
    List<TUserInfo> SelectPointUser(String infoName,String infoTel);
}
