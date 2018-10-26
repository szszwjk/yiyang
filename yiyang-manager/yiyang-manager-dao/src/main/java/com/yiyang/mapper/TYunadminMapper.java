package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TYunadmin;
import com.yiyang.pojo.UserType;
import org.apache.ibatis.annotations.Param;

public interface TYunadminMapper {
   public TYunadmin getYunadminInfo(String username);
   public void updateAdmin(TYunadmin tYunadmin);
   public List<UserType> getComunityType();
   }