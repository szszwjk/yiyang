package com.yiyang.service.tservice;

import com.yiyang.common.utils.YiyangPageResult;

import com.yiyang.pojo.TServiceitem;

public interface Serviceitem {
    YiyangPageResult getServiceItem(int page, int rows) ;
    YiyangPageResult getByLargeAndlittle(int page, int rows, TServiceitem tServiceitem);
}
