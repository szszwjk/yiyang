package com.yiyang.mapper;

import java.util.List;

import com.yiyang.pojo.TUser;
import com.yiyang.pojo.TUserInfo;
import org.apache.ibatis.annotations.Param;

public interface TUserMapper {
    public void insertUser(TUser tUser);
    public TUser selectUserByUser(TUser tUser);
    public TUser selectUserByUsername(String username);
    public void updatePass(TUser tUser);
}