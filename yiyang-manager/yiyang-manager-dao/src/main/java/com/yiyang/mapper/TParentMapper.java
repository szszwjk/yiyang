package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.ParentInfo;
import com.yiyang.pojo.ServiceDesc;
import com.yiyang.pojo.TParent;
import org.apache.ibatis.annotations.Param;
import com.yiyang.pojo.*;
import org.apache.ibatis.annotations.Param;

public interface TParentMapper {
      public void insertTParent(String username);
      public ParentInfo getParentInfo(String username);
      public ServiceDesc getServicesDesc(String itemId);
      public ServiceDesc preServices(String itemId);
      public HServiceList getHServiceList(TPreservice tPreservice);
      public TParent getParent(String username);
      public void updateParent(TParent tParent);
      public List<TDoctor> getDoctor(String dname);
      TParent SelectUserByIdnum(String Idnum);
      void UpdateTParent(String id,String juzhudi ,String xueli,String chushengdi,String xuexing,String guoji,String guominshi,String waishang ,String shoushushi,String yichuanbing,String shequhao);

   }