package com.yiyang.service.impl.parent;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.mapper.*;
import com.yiyang.pojo.*;
import com.yiyang.service.parent.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ParentServiceImpl implements ParentService{
    @Autowired
    private TServiceitemMapper tServiceitemMapper;
    @Autowired
    private TParentMapper tParentMapper;
    @Autowired
    private TPreserviceMapper tPreserviceMapper;
    @Autowired
    private TCommunityMapper tCommunityMapper;
    @Autowired
    private TUserInfoMapper tUserInfoMapper;
    @Autowired
    private TUserMapper tUserMapper;
    @Autowired
    private TConsultMapper tConsultMapper;
    @Override
    public YiyangPageResult getTserviceItem(int page,int rows) {
    //设置分页信息
        PageHelper.startPage(page, rows);
        //执行查询
        List<TServiceitem> list = tServiceitemMapper.selectAll();

        return getPage(list);
    }

    @Override
    public YiyangPageResult getItemByLargeAndLittle(int page, int rows, TServiceitem tServiceitem) {
        //设置分页信息
        PageHelper.startPage(page, rows);
        //执行查询
        List<TServiceitem> list = tServiceitemMapper.selectByLargeAndLittle(tServiceitem);
        //取分页信息
       /* PageInfo<TServiceitem> pageInfo = new PageInfo<>(list);*/

        //创建返回结果对象
      /*  YiyangPageResult result = new YiyangPageResult();
        result.setTotal(pageInfo.getTotal());
        result.setRows(list);*/
        return getPage(list);
    }

    @Override
    public ParentInfo getParentInfo(String username) {
        ParentInfo result = tParentMapper.getParentInfo(username);
        return result;
    }

    @Override
    public ServiceDesc getServicesDesc(String itemId) {
        ServiceDesc desc = tParentMapper.getServicesDesc(itemId);
        return desc;
    }

    @Override
    public ServiceDesc preServices(String itemId) {
        ServiceDesc desc = tParentMapper.preServices(itemId);
        return desc;
    }

    @Override
    public YiyangResult serviceOrder(TPreservice tPreservice) {
        try {
            tPreserviceMapper.insertOrder(tPreservice);
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器超时");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangPageResult getHServices(Integer page, Integer rows, TPreservice tPreservice) {
        PageHelper.startPage(page, rows);
        System.out.println(tPreservice);
        List<TPreservice> hServices = tPreserviceMapper.getHServices(tPreservice);

        return getPage(hServices);
    }

    @Override
    public HServiceList getHServiceList(TPreservice tPreservice) {
        HServiceList result = tParentMapper.getHServiceList(tPreservice);
        return result;
    }

    @Override
    public TParent getParent(String username) {
        TParent parent = tParentMapper.getParent(username);

        return parent;
    }

    @Override
    public List<TCommunity> getCommunity() {
        List<TCommunity> communityList = tCommunityMapper.getCommunity();
        return communityList;
    }

    @Override
    public YiyangResult updateParent(TParent tParent) {
        try {
            tParentMapper.updateParent(tParent);
            tUserInfoMapper.updateUserInfo(tParent.gettUserInfo());
        } catch (Exception e) {

            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangResult updatePass(TUser tUser) {

        TUser user = tUserMapper.selectUserByUser(tUser);
        if(user!=null)
        {
            tUser.setPassword(tUser.getOldpass());
            try {
                tUserMapper.updatePass(tUser);
            } catch (Exception e) {
                e.printStackTrace();
                YiyangResult.build(500,"服务器异常");
            }
            return YiyangResult.ok();
        }
        return YiyangResult.build(500,"旧密码错误");
    }

    @Override
    public void updateImg(TUserInfo tUserInfo) {
        tUserInfoMapper.updateImg(tUserInfo);
    }

    @Override
    public YiyangResult addConsult(TConsult tConsult) {
        try {
            tConsultMapper.addConsult(tConsult);
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangPageResult getConsult(Integer page, Integer rows,TConsult tConsult) {
        PageHelper.startPage(page, rows);
        List<TConsult> list = tConsultMapper.getConsult(tConsult);
        return getPage(list);
    }

    @Override
    public YiyangResult updateConsult(TConsult tConsult) {
        try {
            tConsultMapper.updateConsult(tConsult);
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    public <T>YiyangPageResult getPage(List<T> list){

        PageInfo<T> pageInfo = new PageInfo<>(list);
        YiyangPageResult result = new YiyangPageResult();
        result.setTotal(pageInfo.getTotal());
        result.setRows(list);
        return result;
    }


}
