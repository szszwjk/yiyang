package com.yiyang.service.relation;

import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.*;

import java.util.List;

public interface RelationService {
    /**
     * 得到个人信息
     * @param username
     * @return
     */
    public TRelative getRelativeInfo(String username);

    /**
     * 更新个人信息
     * @param tRelative
     * @return
     */
    public YiyangResult updateRelativeInfo(TRelative tRelative);

    /**
     * 得到老人信息
     * @param page
     * @param rows
     * @param tUserInfo
     * @return
     */
    public YiyangPageResult getParentInfo(Integer page, Integer rows,TUserInfo tUserInfo);

    /**
     * 得到关系
     * @param relationParentKey
     * @return
     */
    public YiyangResult getRelation(RelationParentKey relationParentKey);

    /**
     * 添加关系
     * @param relationParentKey
     */
    public YiyangResult addRelationParentKey(RelationParentKey relationParentKey);

    /**
     * 删除关系
     * @param relationParentKey
     */
    public YiyangResult deleteRelationParentKey(RelationParentKey relationParentKey);

    /**
     * 获取相关联的老人信息
     * @param username
     * @return
     */
    public List<ParentInfo> getParentInfo(String username);

    /**
     *
     * @param page
     * @param rows
     * @param tUserInfo
     * @return
     */
    public YiyangPageResult getAllUserParentInfo(Integer page, Integer rows,TUserInfo tUserInfo);

    /**
     * 获取位置信息
     * @param relationParentKey
     * @return
     */
    List<TLocalinfo> getLocation(RelationParentKey relationParentKey);

    /**
     * 获取相关联的老人的医生建议
     * @param page
     * @param rows
     * @param
     * @return
     */
    public YiyangPageResult getSuggest(Integer page, Integer rows,TDsuggest tDsuggest);
}
