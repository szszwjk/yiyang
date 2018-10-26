package com.yiyang.service.impl.social;

import com.yiyang.mapper.TParentMapper;
import com.yiyang.service.social.UpdateTParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UpdateTParentServiceImpl implements UpdateTParentService {
    @Autowired
    public  TParentMapper tParentMapper;
    @Override
    public void UpdateTParent(String id, String juzhudi, String xueli, String chushengdi, String xuexing, String guoji, String guominshi, String waishang, String shoushushi, String yichuanbing, String shequhao) {
        tParentMapper.UpdateTParent( id, juzhudi, xueli, chushengdi, xuexing, guoji, guominshi, waishang, shoushushi, yichuanbing, shequhao );
    }
}
