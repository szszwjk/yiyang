package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TPreremind;
import org.apache.ibatis.annotations.Param;

public interface TPreremindMapper {
   //查询医生关联的老人的预警信息
   public List<TPreremind> findPreremindAll(String dUser);
   }