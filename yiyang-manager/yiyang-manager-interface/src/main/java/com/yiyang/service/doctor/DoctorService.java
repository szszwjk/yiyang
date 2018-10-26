package com.yiyang.service.doctor;

import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.TConsult;
import com.yiyang.pojo.TDoctor;
import com.yiyang.pojo.TDsuggest;
import com.yiyang.pojo.TPreremind;

import java.util.List;


public interface DoctorService {
     void insertDoctor(TDoctor doctor);
     List<TDoctor> findDoctorByName(String name);
     TDoctor findDoctorByName1(String name);
     //查询所属病人的告警信息
     public List<TPreremind> getPreremind(String dUser);
     //查询所属病人的咨询
     public List<TConsult> getConsult(String cDuser);
     //查询所属病人的评估
     public List<TDsuggest> getSuggest(String Tduser);
     //插入医生评估
     public YiyangResult insertSuggest(TDsuggest tDsuggest);
     //修改医生答复
     public YiyangResult updateConsult(TConsult tConsult);
}
