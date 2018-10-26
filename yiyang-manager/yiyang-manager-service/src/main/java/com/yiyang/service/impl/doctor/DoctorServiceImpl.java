package com.yiyang.service.impl.doctor;

import com.yiyang.mapper.TDoctorMapper;
import com.yiyang.pojo.TDoctor;
import com.yiyang.service.doctor.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    private TDoctorMapper tDoctorMapper;
    @Override
    public void insertDoctor(TDoctor doctor) {
        tDoctorMapper.insertDoctor( doctor );
    }

    @Override
    public List<TDoctor> findDoctorByName(String name) {
        List<TDoctor> tDoctor = tDoctorMapper.findDoctorByName(name);
        System.out.println(tDoctorMapper);


        return tDoctor;
    }
}
