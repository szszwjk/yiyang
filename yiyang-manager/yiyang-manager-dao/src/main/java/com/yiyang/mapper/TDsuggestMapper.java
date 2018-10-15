package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TDsuggest;
import org.apache.ibatis.annotations.Param;

public interface TDsuggestMapper {
   public List<TDsuggest> getTDsuggestMapper(String username);
   }