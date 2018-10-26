package com.yiyang.mapper;

import com.yiyang.pojo.TDoctor;

import java.util.List;

public interface TDoctorMapper {
   void insertDoctor(TDoctor doctor);
   List<TDoctor> findDoctorByName(String Name);
   TDoctor findDoctorByName1(String Name);
   List<TDoctor> selectAllDoc( );
}