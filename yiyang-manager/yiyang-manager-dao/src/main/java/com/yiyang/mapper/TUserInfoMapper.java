package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TUserInfo;
import org.apache.ibatis.annotations.Param;

public interface TUserInfoMapper {
     void insertTUserInfo(TUserInfo tUserInfo);
     TUserInfo selectTUserInfoByTelnumber(String telnumber);
     List<TUserInfo> SelectAllUser ();
     List<TUserInfo> SelectPointUser(String name,String telnumber);
    }