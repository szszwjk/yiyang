package com.yiyang.service.social;

import com.yiyang.pojo.TPreservice;

import java.util.List;

public interface SelectPreserviceByNameService {
    List<TPreservice> selectPreserviceByName(String name);
}
