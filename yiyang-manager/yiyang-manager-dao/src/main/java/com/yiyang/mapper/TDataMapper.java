package com.yiyang.mapper;


import java.util.Date;
import java.util.List;

import com.yiyang.pojo.TData;
import org.apache.ibatis.annotations.Param;

public interface TDataMapper {
  public List<TData> selectDataByWeekOrMonth(int flag,String item,String username);
  public List<TData> selectDataAddWeek(TData tData);
  public List<TData> selectDataSubWeek(TData tData);
  public List<TData> selectDataBetween(TData tData);
  }