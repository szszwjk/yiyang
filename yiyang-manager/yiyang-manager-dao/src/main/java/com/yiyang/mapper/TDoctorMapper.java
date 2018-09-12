package com.yiyang.mapper;



import com.yiyang.pojo.TDoctor;




public interface TDoctorMapper {
   void insertDoctor(TDoctor doctor);
   TDoctor findDoctorByName(String Name);
}