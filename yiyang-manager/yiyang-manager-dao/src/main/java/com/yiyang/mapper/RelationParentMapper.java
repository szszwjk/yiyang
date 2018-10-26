package com.yiyang.mapper;


import java.util.List;

import com.yiyang.pojo.RelationParentKey;
import org.apache.ibatis.annotations.Param;

public interface RelationParentMapper {
    public RelationParentKey getRelation(RelationParentKey relationParentKey);
    public void addRelationParentKey(RelationParentKey relationParentKey);
    public void deleteRelationParentKey(RelationParentKey relationParentKey);
    public List<RelationParentKey> getRelationList(String  username);
    }