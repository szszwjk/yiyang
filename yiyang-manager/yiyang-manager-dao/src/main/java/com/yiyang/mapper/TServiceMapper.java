package com.yiyang.mapper;

import java.util.List;

import com.yiyang.pojo.TService;
import org.apache.ibatis.annotations.Param;

public interface TServiceMapper {

    TService findInfoByUser(String sUser);

     // void updateByUser(TService tService);
    }