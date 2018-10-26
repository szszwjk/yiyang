package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TDsuggest;
import com.yiyang.pojo.TRelative;
import com.yiyang.pojo.TUserInfo;
import org.apache.ibatis.annotations.Param;

public interface TRelativeMapper {
    public TRelative getRelativeInfo(String username);
    public void updateRelative(TRelative tRelative);
    public List<TUserInfo> getParentInfo(TUserInfo tUserInfo);
    public List<TDsuggest> getSuggest(TDsuggest tDsuggest);

    }