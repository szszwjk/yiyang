package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.ParentInfo;
import com.yiyang.pojo.ServiceDesc;
import org.apache.ibatis.annotations.Param;

public interface TParentMapper {
      public void insertTParent(String username);
      public ParentInfo getParentInfo(String username);
      public ServiceDesc getServicesDesc(String itemId);
   }