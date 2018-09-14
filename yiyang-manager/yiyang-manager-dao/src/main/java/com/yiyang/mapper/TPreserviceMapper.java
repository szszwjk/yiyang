package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TPreservice;
import org.apache.ibatis.annotations.Param;

public interface TPreserviceMapper {
   List<TPreservice> findAll();
   }