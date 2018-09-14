package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TUserInfo;
import org.apache.ibatis.annotations.Param;

public interface TUserInfoMapper {
    public void insertTUserInfo(TUserInfo tUserInfo);
    public TUserInfo selectTUserInfoByTelnumber(String telnumber);
    }