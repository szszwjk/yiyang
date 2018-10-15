package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TInspection;

public interface TInspectionMapper {
  public List<TInspection> getTInspection(TInspection tInspection);
  public void addTInspection(TInspection tInspection);
  public void editTInspection(TInspection tInspection);
  public void deleteTInspection(int iId);
  }