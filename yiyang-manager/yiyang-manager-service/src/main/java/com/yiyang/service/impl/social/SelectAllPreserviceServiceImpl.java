package com.yiyang.service.impl.social;

import com.yiyang.mapper.TPreserviceMapper;
import com.yiyang.pojo.TPreservice;
import com.yiyang.service.social.SelectAllPreserviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;
@Service
public class SelectAllPreserviceServiceImpl implements SelectAllPreserviceService {
    @Autowired
     public  TPreserviceMapper tPreserviceMapper;
    @Override
    public List<TPreservice> selectAllPreservice() {
        List<TPreservice> result = tPreserviceMapper.selectAllPreservice();
//        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        for(int i = 0; i<result.size();i++){
//            TPreservice  tPreservice = result.get( i );
//            tPreservice.
//        }
        return result;
    }
}
