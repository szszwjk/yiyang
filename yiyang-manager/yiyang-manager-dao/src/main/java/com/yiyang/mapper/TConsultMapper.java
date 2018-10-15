package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TConsult;
import org.apache.ibatis.annotations.Param;

public interface TConsultMapper {
   public void addConsult(TConsult tConsult);
   public List<TConsult> getConsult(TConsult tConsult);
   public void updateConsult(TConsult tConsult);
   }