package com.yiyang.mapper;

import java.util.List;

import com.yiyang.pojo.TMedical;

public interface TMedicalMapper {
   public List<TMedical> getTMedical(TMedical tMedical);
   public void addTMedical(TMedical tMedical);
   public void editTMedical(TMedical tMedical);
   public void deleteTMedical(int mId);
   }