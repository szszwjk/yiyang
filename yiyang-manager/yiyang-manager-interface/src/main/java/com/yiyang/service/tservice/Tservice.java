package com.yiyang.service.tservice;

import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.TService;

public interface Tservice {
   TService findInfoByUser(String sUser);

   YiyangResult updateByUser(TService tService);
}
