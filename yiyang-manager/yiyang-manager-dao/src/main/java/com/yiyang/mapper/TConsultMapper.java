package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TConsult;
import org.apache.ibatis.annotations.Param;

public interface TConsultMapper {

   public void addConsult(TConsult tConsult);
   public List<TConsult> getConsult(TConsult tConsult);
   public void updateConsult(TConsult tConsult);

   //查询医生所属病人的咨询
   public List<TConsult> findConsultAll(String cDuser);
   //修改医生回答
   public void updateAnser(TConsult tConsult);

   }