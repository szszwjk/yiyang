package com.yiyang.social.controller;

import com.yiyang.pojo.TDoctor;
import com.yiyang.pojo.TParent;
import com.yiyang.pojo.TService;
import com.yiyang.service.doctor.DoctorService;
import com.yiyang.service.social.SelectServiceByNameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller
    public class DanganController {
        @Autowired
        public DoctorService doctorService;
        @RequestMapping(value = "/chaxunYS", method = RequestMethod.GET)

        public String chart2(HttpServletRequest request, HttpServletResponse response ) throws UnsupportedEncodingException {
            request.setCharacterEncoding("UTF-8");
        String DoctorName =new String(request.getParameter("DoctorName"));
        String infoTel = request.getParameter("HospitalName");
            String name = "赵九";
            List<TDoctor> doctor = doctorService.findDoctorByName(name );
            request.setAttribute( "result",doctor );

            return "dangan";
        }

    @Autowired
    public SelectServiceByNameService selectServiceByNameService;
    @RequestMapping(value = "/chaxunFW", method = RequestMethod.GET)

    public String chart3(HttpServletRequest request, HttpServletResponse response ) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String DoctorName =new String(request.getParameter("ServiceName"));
        String infoTel = request.getParameter("ServiceNumber");
        String name = "User";
        List<TService> ServiceResult = selectServiceByNameService.SelectServiceByName( name );
        request.setAttribute( "ServiceResult",ServiceResult );

        return "dangan";
    }

    }
