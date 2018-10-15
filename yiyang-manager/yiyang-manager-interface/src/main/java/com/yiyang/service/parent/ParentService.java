package com.yiyang.service.parent;

import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.*;

import java.util.Date;
import java.util.List;

public interface ParentService {
    public YiyangPageResult getTserviceItem(int page, int rows);

    /**
     * 根据条件查询信息
     * @param page
     * @param rows
     * @param tServiceitem
     * @return
     */
    public YiyangPageResult getItemByLargeAndLittle(int page, int rows, TServiceitem tServiceitem);

    /**
     * 获取老人基本信息
     * @param username
     * @return
     */
    public ParentInfo getParentInfo(String username);

    /**
     * 获取服务详细信息
     * @param itemId
     * @return
     */
    public ServiceDesc getServicesDesc(String itemId);

    public ServiceDesc preServices(String itemId);
    public YiyangResult serviceOrder(TPreservice tPreservice);

    /**
     * 获取历史订单列表
     * @param page
     * @param rows
     * @param tPreservice
     * @return
     */
    public YiyangPageResult getHServices(Integer page, Integer rows, TPreservice tPreservice);


    /**
     * 获取历史订单详情
     * @param tPreservice
     * @return
     */
    public HServiceList getHServiceList(TPreservice tPreservice);

    /**
     * 得到详细的老人信息
     * @param username
     * @return
     */
    public TParent getParent(String username);

    /**
     * 获得社区集合列表
     * @return
     */
    public List<TCommunity> getCommunity();

    /**
     * 更新parent
     * @param tParent
     */
    public YiyangResult updateParent(TParent tParent);

    /**
     * 修改密码
     * @param tUser
     * @return
     */
    public YiyangResult updatePass(TUser tUser);
    public void updateImg(TUserInfo tUserInfo);

    /**
     * 添加咨询
     * @param tConsult
     * @return
     */
    public YiyangResult addConsult(TConsult tConsult);

    /**
     * 获取咨询
     * @param tConsult
     * @return
     */
    public YiyangPageResult getConsult(Integer page, Integer rows,TConsult tConsult);

    /**
     * 回答咨询
     * @param tConsult
     * @return
     */
    public YiyangResult updateConsult(TConsult tConsult);

}
