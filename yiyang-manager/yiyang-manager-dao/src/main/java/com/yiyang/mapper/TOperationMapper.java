package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TOperation;
import com.yiyang.pojo.TPreoption;
import org.apache.ibatis.annotations.Param;

public interface TOperationMapper {
  public List<TOperation> getTOperation(TOperation tOperation);
  public void addOperation(TOperation tOperation);
  public void editOperation(TOperation tOperation);
  public void deleteOperation(int opId);
  }