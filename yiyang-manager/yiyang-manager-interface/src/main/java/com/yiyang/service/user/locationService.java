package com.yiyang.service.user;

import com.yiyang.pojo.TLocalinfo;


public interface LocationService {

     void insertLocation(TLocalinfo tLocalinfo);
     void findLocationByUser(String userName);
}
