package com.yiyang.mapper;

import java.util.List;

import com.yiyang.pojo.TService;
import org.apache.ibatis.annotations.Param;

public interface TServiceMapper {
    void insertService(String username);
    TService findInfoByUser(String sUser);
     // void updateByUser(TService tService);
    List<TService> selectAllService();
    List<TService> selectServiceByName( String name);
     void updateByUser(TService tService);
    }