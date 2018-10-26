package com.yiyang.service.impl.relation;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.mapper.*;
import com.yiyang.pojo.*;
import com.yiyang.service.relation.RelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RelationServiceImpl implements RelationService {

    @Autowired
    private TRelativeMapper tRelativeMapper;
    @Autowired
    private TUserInfoMapper tUserInfoMapper;
    @Autowired
    private RelationParentMapper relationParentMapper;
    @Autowired
    private TParentMapper tParentMapper;
    @Autowired
    private TPreremindMapper tPreremindMapper;
    @Autowired
    private TLocalinfoMapper tLocalinfoMapper;
    @Override
    public TRelative getRelativeInfo(String username) {
        TRelative relativeInfo = tRelativeMapper.getRelativeInfo(username);
        return relativeInfo;
    }

    @Override
    public YiyangResult updateRelativeInfo(TRelative tRelative) {
        try {
            tRelativeMapper.updateRelative(tRelative);
            tUserInfoMapper.updateUserInfo(tRelative.gettUserInfo());
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangPageResult getParentInfo(Integer page, Integer rows,TUserInfo tUserInfo) {
        PageHelper.startPage(page,rows);
        List<TUserInfo> parentInfo = tRelativeMapper.getParentInfo(tUserInfo);
        return getPage(parentInfo);
    }

    @Override
    public YiyangResult getRelation(RelationParentKey relationParentKey) {

        return null;
    }

    @Override
    public YiyangResult addRelationParentKey(RelationParentKey relationParentKey) {
        RelationParentKey result = relationParentMapper.getRelation(relationParentKey);
        if(result==null)
        {
            try {
                relationParentMapper.addRelationParentKey(relationParentKey);
            } catch (Exception e) {
                e.printStackTrace();
                YiyangResult.build(500,"服务器异常");
            }
            return YiyangResult.ok();
        }
        return YiyangResult.build(500,"关系已存在无需再次添加");
    }

    @Override
    public YiyangResult deleteRelationParentKey(RelationParentKey relationParentKey) {
        try {
            relationParentMapper.deleteRelationParentKey(relationParentKey);
        } catch (Exception e) {
            e.printStackTrace();
            YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public List<ParentInfo> getParentInfo(String username) {
        List<ParentInfo> infoList=new ArrayList<>();
        List<RelationParentKey> relationList = relationParentMapper.getRelationList(username);
        for (RelationParentKey re:relationList) {
            ParentInfo parentInfo = tParentMapper.getParentInfo(re.getpUser());
            infoList.add(parentInfo);
        }
        return infoList;
    }

    @Override
    public YiyangPageResult getAllUserParentInfo(Integer page, Integer rows, TUserInfo tUserInfo) {
        PageHelper.startPage(page,rows);
        List<TPreremind> list = tPreremindMapper.getAllUserTPreremind(tUserInfo);
        for(int i=0;i<list.size();i++)
        {
            switch (list.get(i).getPrItem())
            {
                case "xt": list.get(i).setPrItem("血糖"); break;
                case "xy": list.get(i).setPrItem("血氧"); break;
                case "xl": list.get(i).setPrItem("心率"); break;
            }

        }
        return getPage(list);
    }

    @Override
    public List<TLocalinfo> getLocation(RelationParentKey relationParentKey) {
        List<TLocalinfo> location = tLocalinfoMapper.getLocation(relationParentKey);

        return location;
    }

    @Override
    public YiyangPageResult getSuggest(Integer page, Integer rows, TDsuggest tDsuggest) {
        PageHelper.startPage(page,rows);
        List<TDsuggest> suggest = tRelativeMapper.getSuggest(tDsuggest);
        return getPage(suggest);
    }


    public <T>YiyangPageResult getPage(List<T> list){

        PageInfo<T> pageInfo = new PageInfo<>(list);
        YiyangPageResult result = new YiyangPageResult();
        result.setTotal(pageInfo.getTotal());
        result.setRows(list);
        return result;
    }
}
