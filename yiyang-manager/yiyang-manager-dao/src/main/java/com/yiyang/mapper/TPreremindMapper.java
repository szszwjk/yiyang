package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TPreremind;
import org.apache.ibatis.annotations.Param;

public interface TPreremindMapper {
   public List<TPreremind> getTPreremind(TPreremind tPreremind);
   public void updateFlag(TPreremind tPreremind);
   }