package com.yiyang.service.impl.social;

import com.yiyang.mapper.TDoctorMapper;
import com.yiyang.pojo.TDoctor;
import com.yiyang.service.social.SelectAllDocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SelectAllDocServiceImpl implements SelectAllDocService {
    @Autowired
    private TDoctorMapper tDoctorMapper;
    @Override
    public List<TDoctor> selectAllDoc() {
        List<TDoctor> list = tDoctorMapper.selectAllDoc();
        return list;
    }
}
