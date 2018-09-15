package com.yiyang.mapper;

import java.util.List;

import com.yiyang.pojo.TService;
import org.apache.ibatis.annotations.Param;

public interface TServiceMapper {
    /**
     * 根据
     * @return
     */
    TService findAll(String sUser);

    void  updateTservice(TService tService);
    }