package com.yiyang.mapper;
import java.util.List;
import com.yiyang.pojo.TPreservice;

public interface TPreserviceMapper {
   /**
    * 查询显示待处理工单所有信息
    * @return
    */
   List<TPreservice> findDCL();
   /**
    * 查询显示已接收工单所有信息
    * @return
    */
   List<TPreservice> findYJD(TPreservice tPreservice);
   /**
    * 查询显示已完成工单所有信息
    * @return
    */
   List<TPreservice> findYWC(TPreservice tPreservice);


    List<TPreservice> findAll();

   int findType(int type);
   }