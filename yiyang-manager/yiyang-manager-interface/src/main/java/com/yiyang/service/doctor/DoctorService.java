package com.yiyang.service.doctor;

import com.yiyang.pojo.TDoctor;

import java.util.List;


public interface DoctorService {
     void insertDoctor(TDoctor doctor);
     List<TDoctor> findDoctorByName(String name);
}
