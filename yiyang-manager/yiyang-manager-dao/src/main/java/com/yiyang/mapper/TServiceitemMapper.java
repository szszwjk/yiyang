package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TPreservice;
import com.yiyang.pojo.TServiceitem;
import org.apache.ibatis.annotations.Param;

public interface TServiceitemMapper {

    /**
     * 根据选项查询信息
     * @return
     */
    List<TServiceitem> selectAll();

    void insertServiceItem(TServiceitem tServiceitem);

    List<TServiceitem> selectByLargeAndLittle(TServiceitem tServiceitem);

    TServiceitem findBySiId(int siId);

    void updateServiceItem(TServiceitem tServiceitem);

    void deleteBySiId(int siId);

    }