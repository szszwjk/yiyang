package com.yiyang.mapper;

import java.util.List;

import com.yiyang.pojo.TLocalinfo;
import org.apache.ibatis.annotations.Param;

public interface TLocalinfoMapper {
    void insertLocation (TLocalinfo location);
    }