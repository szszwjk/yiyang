package com.yiyang.service.tservice;

import com.yiyang.common.utils.YiyangPageResult;

import com.yiyang.common.utils.YiyangResult;

import com.yiyang.pojo.TPreservice;



public interface TpreService {
    YiyangPageResult getTpreServicedcl(int page, int rows);

    YiyangPageResult getByUnameAndTeldcl(int page, int rows, TPreservice tPreservice);


    YiyangPageResult getTpreServiceyjd(int page, int rows);
    YiyangPageResult getByUnameAndTelyjd(int page, int rows, TPreservice tPreservice);

    YiyangPageResult getTpreServiceywc(int page, int rows);
    YiyangPageResult getByUnameAndTelywc(int page, int rows, TPreservice tPreservice);


    TPreservice findByPsNumber(String psNumber);

    public YiyangResult updateFlag2(String psNumber);
    public YiyangResult updateFlag3(String psNumber);
    public YiyangResult updateFlag4(String psNumber);


}





