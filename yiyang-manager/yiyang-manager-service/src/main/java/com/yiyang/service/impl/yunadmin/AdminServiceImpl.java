package com.yiyang.service.impl.yunadmin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.mapper.TAuthorityMapper;
import com.yiyang.mapper.TUserInfoMapper;
import com.yiyang.mapper.TYunadminMapper;
import com.yiyang.mapper.UserAuthorityMapper;
import com.yiyang.pojo.TAuthority;
import com.yiyang.pojo.TYunadmin;
import com.yiyang.pojo.UserAuthorityKey;
import com.yiyang.pojo.UserType;
import com.yiyang.service.yunadmin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    private TYunadminMapper tYunadminMapper;
    @Autowired
    private TUserInfoMapper tUserInfoMapper;
    @Autowired
    private UserAuthorityMapper userAuthorityMapper;
    @Autowired
    private TAuthorityMapper tAuthorityMapper;
    @Override
    public TYunadmin getAdminInfo(String username) {
        TYunadmin yunadminInfo = tYunadminMapper.getYunadminInfo(username);

        return yunadminInfo;
    }

    @Override
    public YiyangResult updateInfo(TYunadmin tYunadmin) {
        try {
            tUserInfoMapper.updateUserInfo(tYunadmin.gettUserInfo());
            if((tYunadmin.getyDepartment()!=""&&tYunadmin.getyDepartment()!=null)||(tYunadmin.getyEmail()!=""&&tYunadmin.getyEmail()!=null))
            tYunadminMapper.updateAdmin(tYunadmin);
        } catch (Exception e) {
            e.printStackTrace();
            return  YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public List<UserType> getUserType() {
        List<UserType> userType = userAuthorityMapper.getUserType();

        return userType;
    }

    @Override
    public List<UserType> getComunity() {
        List<UserType> userType = tYunadminMapper.getComunityType();
        return userType;
    }

    @Override
    public YiyangPageResult getAllUser(Integer page, Integer rows, UserAuthorityKey userAuthorityKey) {
        PageHelper.startPage(page,rows);
        List<UserAuthorityKey> allUser = userAuthorityMapper.getAllUser(userAuthorityKey);
        return getPage(allUser);
    }

    @Override
    public List<UserAuthorityKey> getUserAuthorityKeyByUser(String username) {
        List<UserAuthorityKey> result = userAuthorityMapper.getUserAuthorityKeyByUser(username);
        return result;
    }

    @Override
    public YiyangResult updateUserAuthority(List<UserAuthorityKey> userAuthorityKeys,String username) {
        try {
            userAuthorityMapper.deleteUserAuthority(username);
            if(userAuthorityKeys.size()!=0)
            userAuthorityMapper.addUserAuthority(userAuthorityKeys);
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangPageResult getAllAuthority(Integer page, Integer rows, TAuthority tAuthority) {
        PageHelper.startPage(page,rows);
        List<TAuthority> authority = tAuthorityMapper.getAuthority(tAuthority);

        return getPage(authority);
    }

    @Override
    public YiyangResult updateAuthority(TAuthority tAuthority) {
        try {
            tAuthorityMapper.updateAuthority(tAuthority);
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangResult deleteAuthority(TAuthority tAuthority) {
        try {
            tAuthorityMapper.deleteAuthority(tAuthority);
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"服务器异常");
        }
        return YiyangResult.ok();
    }

    @Override
    public YiyangResult addAuthority(TAuthority tAuthority) {
        try {
            tAuthorityMapper.addAuthority(tAuthority);
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
