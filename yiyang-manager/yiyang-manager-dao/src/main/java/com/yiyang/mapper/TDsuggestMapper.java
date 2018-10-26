package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TDsuggest;
import org.apache.ibatis.annotations.Param;

public interface TDsuggestMapper {
   public List<TDsuggest> getTDsuggestMapper(String username);
   //查询医生评价
   public List<TDsuggest> findTDsuggestBydsDuser(String Tduser);

   public void insertTDsuggest(TDsuggest tDsuggest);

   }