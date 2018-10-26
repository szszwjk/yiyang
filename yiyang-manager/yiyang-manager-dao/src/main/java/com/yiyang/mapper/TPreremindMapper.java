package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TPreremind;
import com.yiyang.pojo.TUserInfo;
import org.apache.ibatis.annotations.Param;

public interface TPreremindMapper {
   public List<TPreremind> getTPreremind(TPreremind tPreremind);
   public void updateFlag(TPreremind tPreremind);
   public List<TPreremind> getAllUserTPreremind(TUserInfo tUserInfo);
   //查询医生关联的老人的预警信息
   public List<TPreremind> findPreremindAll(String dUser);

   }