package com.yiyang.mapper;
import java.util.List;
import java.util.Map;

import com.yiyang.pojo.TPreservice;

public interface TPreserviceMapper {
   /**
    * 查询显示待处理工单所有信息
    * @return
    */
   List<TPreservice> findDCL(TPreservice tPreservice);
    List<TPreservice> findDCLAll();
   /**
    * 查询显示已接收工单所有信息
    * @return
    */
   List<TPreservice> findYJD(TPreservice tPreservice);
    List<TPreservice> findYJDAll();
   /**
    * 查询显示已完成工单所有信息
    * @return
    */
   List<TPreservice> findYWC(TPreservice tPreservice);
    List<TPreservice> findYWCAll();



    /**
     * 根据工单编号查询工单具体信息 三表查询
     * @param psNumber 工单编号
     * @return 工单信息
     */
    TPreservice findByPsNumber(String psNumber);

    /**
     *服务商点击接受待处理工单
     */
   void updateFlag2(String psNumber);

    /*服务商点击提交处理已接单工单
     *
     */
   void updateFlag3(String psNumber);

    List<TPreservice> findAll();

   int findType(int type);

     /**
     * 服务商点击拒绝工单
     */
   void updateFlag4(String psNumber);

    List<TPreservice> selectAllPreservice();
    void deletePreserviceByNum(String num);
    List<TPreservice> selectPreserviceByName( String name);
   }