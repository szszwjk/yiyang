package com.yiyang.familyDoctor.controller;

import com.yiyang.pojo.TDoctor;
import com.yiyang.service.doctor.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FamilyDoctorController {
    @Autowired
    DoctorService doctorService;

    @RequestMapping("/{dUser}")
    @ResponseBody
    public TDoctor getDoctor(@PathVariable String dUser){
        TDoctor tDoctor= doctorService.findDoctorByName(dUser);
        System.out.print(tDoctor);
        return tDoctor;
    }


}
