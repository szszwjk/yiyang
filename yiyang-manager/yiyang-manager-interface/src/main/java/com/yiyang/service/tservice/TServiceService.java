package com.yiyang.service.tservice;

import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.TService;

public interface TServiceService {

   TService getTServiceByUser(String sUser);

    YiyangResult updateTService(TService tService);

}
