package com.yiyang.mapper;

import java.util.List;

import com.yiyang.pojo.TUser;
import org.apache.ibatis.annotations.Param;

public interface TUserMapper {
    public void insertUser(TUser tUser);
    public TUser selectUserByUser(TUser tUser);
    public TUser selectUserByUsername(String username);
}