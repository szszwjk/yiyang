package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.TAuthority;
import com.yiyang.pojo.TUser;
import org.apache.ibatis.annotations.Param;

public interface TAuthorityMapper {
   public TUser loginByUser(TUser tUser);
   public List<TAuthority> getAuthority(TAuthority tAuthority);
   public void updateAuthority(TAuthority tAuthority);
   public void deleteAuthority(TAuthority tAuthority);
   public void addAuthority(TAuthority tAuthority);
   }