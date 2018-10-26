package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.ParentInfo;
import com.yiyang.pojo.ServiceDesc;
import com.yiyang.pojo.TParent;
import org.apache.ibatis.annotations.Param;

public interface TParentMapper {
        void insertTParent(String username);
        ParentInfo getParentInfo(String username);
        ServiceDesc getServicesDesc(String itemId);
        TParent SelectUserByIdnum(String Idnum);
        void UpdateTParent(String id,String juzhudi ,String xueli,String chushengdi,String xuexing,String guoji,String guominshi,String waishang ,String shoushushi,String yichuanbing,String shequhao);

   }