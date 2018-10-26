package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TCommunity;
import org.apache.ibatis.annotations.Param;

public interface TCommunityMapper {
   public List<TCommunity> getCommunity();

   }