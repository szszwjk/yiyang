package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TServiceitem;
import org.apache.ibatis.annotations.Param;

public interface TServiceitemMapper {
    List<TServiceitem> selectAll();
    }