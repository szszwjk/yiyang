package com.yiyang.service.parent;

import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.*;

import java.util.Date;
import java.util.List;

public interface ParentData {
    /**
     * 查询七天或者一个月
     * @param flag
     * @param item
     * @param username
     * @return
     */
    public List<TData> selectDataByWeekOrMonth(int flag, String item, String username);

    /**
     * 指定时间加7天
     * @param tData
     * @return
     */
    public List<TData> selectDataAddWeek(TData tData);

    /**
     * 指定时间减七天
     * @param tData
     * @return
     */
    public List<TData> selectDataSubWeek(TData tData);

    /**
     * 一段时间之内
     *
     */
    public List<TData> selectDataBetween(TData tData);

    /**
     * 得到预警设置
     * @param username
     * @return
     */
    public List<TPreoption> getTPreoptionforUsername(String username);

    /**
     *插入预警信息
     * @param tPreoption
     */
    public void insertPreoption(TPreoption tPreoption);

    /**
     * 更新预警信息
     *
     * @param tPreoption
     */
    public void updatePreoption(TPreoption tPreoption);

    /**
     * 根据username和item获取对象
     * @param tPreoption
     * @return
     */
    public boolean getTpreoptionByItem(TPreoption tPreoption);

    /**
     * 获取预警信息
     * @param tPreremind
     * @return
     */
    public YiyangPageResult getTPreremind(Integer page,Integer rows, TPreremind tPreremind);

    /**
     * 修改flag
     * @param
     */
    public void updateFlag(TPreremind tPreremind);

    /**
     * 获取手术记录
     * @param tOperation
     * @return
     */
    public YiyangPageResult getTOperation(Integer page,Integer rows, TOperation tOperation);

    /**
     * 添加手术信息
     * @param tOperation
     */
    public YiyangResult addOperation(TOperation tOperation);

    /**
     * 修改手术信息
     * @param tOperation
     */
    public YiyangResult editOperation(TOperation tOperation);

    /**
     * 删除信息
     * @param opId
     */
    public YiyangResult deleteOperation(int opId);

    /**
     * 得到住院信息
     * @param tMedical
     * @return
     */
    public YiyangPageResult getTMedical(Integer page,Integer rows,TMedical tMedical);

    /**
     * 添加住院信息
     * @param tMedical
     */
    public YiyangResult addTMedical(TMedical tMedical);

    /**
     * 修改住院信息
     * @param tMedical
     */
    public YiyangResult editTMedical(TMedical tMedical);

    /**
     * 删除住院信息
     * @param mId
     */
    public YiyangResult deleteTMedical(int mId);

    /**
     * 获取检测信息
     * @param page
     * @param rows
     * @param tInspection
     * @return
     */
    public YiyangPageResult getTInspection(Integer page,Integer rows, TInspection tInspection);

    /**
     * 添加检测信息
     * @param tInspection
     * @return
     */
    public YiyangResult addTInspection(TInspection tInspection);

    /**
     * 编辑检测信息
     * @param tInspection
     * @return
     */
    public YiyangResult editTInspection(TInspection tInspection);

    /**
     * 删除检测信息
     * @param iId
     * @return
     */
    public YiyangResult deleteTInspection(int iId);

    /**
     * 得到建议
     * @param page
     * @param rows
     * @param username
     * @return
     */
    public YiyangPageResult getTDsuggest(Integer page,Integer rows, String username);

    /**
     * 随机得到八条医生信息
     * @param dname
     * @return
     */
    public List<TDoctor> getDoctor(String dname);
}
