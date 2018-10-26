package com.yiyang.service.impl.doctor;

import com.yiyang.common.utils.YiyangResult;
import com.yiyang.mapper.TConsultMapper;
import com.yiyang.mapper.TDoctorMapper;
import com.yiyang.mapper.TDsuggestMapper;
import com.yiyang.mapper.TPreremindMapper;
import com.yiyang.pojo.TConsult;
import com.yiyang.pojo.TDoctor;
import com.yiyang.pojo.TDsuggest;
import com.yiyang.pojo.TPreremind;
import com.yiyang.service.doctor.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    private TDoctorMapper tDoctorMapper;
    @Autowired
    private TPreremindMapper tPreremindMapper;
    @Autowired
    private TConsultMapper tConsultMapper;
    @Autowired
    private TDsuggestMapper tDsuggestMapper;
    @Override
    public void insertDoctor(TDoctor doctor) {
        tDoctorMapper.insertDoctor( doctor );
    }

    @Override
    public TDoctor findDoctorByName(String name) {
        TDoctor tDoctor = tDoctorMapper.findDoctorByName(name);
        System.out.println(tDoctorMapper);

        System.out.println(tDoctor);
        return tDoctor;
    }

    @Override
    public List<TPreremind> getPreremind(String dUser) {
        return  tPreremindMapper.findPreremindAll(dUser);
    }

    @Override
    public List<TConsult> getConsult(String cDuser) {
        return tConsultMapper.findConsultAll(cDuser);
    }

    @Override
    public List<TDsuggest> getSuggest(String Tduser) {
        return tDsuggestMapper.findTDsuggestBydsDuser(Tduser);
    }

    @Override
    public YiyangResult insertSuggest(TDsuggest tDsuggest) {
        try {
            tDsuggestMapper.insertTDsuggest(tDsuggest);
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangResult updateConsult(TConsult tConsult) {
        tConsultMapper.updateAnser(tConsult);
        return YiyangResult.ok();
    }
}
