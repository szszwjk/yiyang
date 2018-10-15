package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TPreoption;
import org.apache.ibatis.annotations.Param;

public interface TPreoptionMapper {
    public List<TPreoption> getTPreoptionforUsername(String username);
    public void insertPreoption(TPreoption tPreoption);
    public void updatePreoption(TPreoption tPreoption);

    /**
     * 根据username和item获取对象
     * @param tPreoption
     * @return
     */
    public TPreoption getTpreoptionByItem(TPreoption tPreoption);
    }