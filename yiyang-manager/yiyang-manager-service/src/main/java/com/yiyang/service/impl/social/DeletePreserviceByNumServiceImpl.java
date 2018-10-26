package com.yiyang.service.impl.social;

import com.yiyang.mapper.TPreserviceMapper;
import com.yiyang.service.social.DeletePreserviceByNumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeletePreserviceByNumServiceImpl implements DeletePreserviceByNumService {
    @Autowired
    public TPreserviceMapper tPreserviceMapper;
    @Override
    public void deletePreserviceByNum(String num) {
        tPreserviceMapper.deletePreserviceByNum( num );
    }
}
