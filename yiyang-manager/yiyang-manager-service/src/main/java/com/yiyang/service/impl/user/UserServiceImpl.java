package com.yiyang.service.impl.user;

import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.mapper.*;

import com.yiyang.pojo.TUser;
import com.yiyang.pojo.TUserInfo;
import com.yiyang.pojo.UserAuthorityKey;
import com.yiyang.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class UserServiceImpl implements UserService{
    @Value("${USER_INFO}")
    private String USER_INFO;
    @Value("${SESSION_EXPIRE}")
    private int SESSION_EXPIRE;
    @Autowired
    private TUserInfoMapper tUserInfoMapper;
    @Autowired
    private TParentMapper tParentMapper;
    @Autowired
    private UserAuthorityMapper userAuthorityMapper;
    @Autowired
    private TUserMapper tUserMapper;
    @Autowired
    private TAuthorityMapper authorityMapper;
    @Autowired
    private JedisClient jedisClient;


    @Override
    public YiyangResult userLogin(TUser tUser) {
        TUser user = tUserMapper.selectUserByUser(tUser);
        if(user!=null)
        {
            user = selectAuthorityByUser(tUser);
            if(user!=null)
            {
                String uuid = UUID.randomUUID().toString();
                String token = uuid.replace("-", "");
                YiyangResult yiyangResult=new YiyangResult();
                yiyangResult.setStatus(200);
                yiyangResult.setMsg(token);
                yiyangResult.setData(user.getAuthorityCon());
                jedisClient.set(USER_INFO+":"+token,JsonUtils.objectToJson(user));
                jedisClient.expire(USER_INFO + ":" + token, SESSION_EXPIRE);
                return yiyangResult;

            }
            else{
                return YiyangResult.build(500,"您的账户无此功能");
            }
        }
        return YiyangResult.build(500,"用户名或密码错误");
    }

    @Override
    public TUser selectAuthorityByUser(TUser tUser) {
        TUser user = authorityMapper.loginByUser(tUser);
        return user;
    }

    @Override
    public YiyangResult registerUser(TUser tUser, String telnumber) {
        TUser selectResult = null;
        try {
            selectResult = tUserMapper.selectUserByUsername(tUser.getUsername());
        } catch (Exception e) {
            e.printStackTrace();
            return YiyangResult.build(500,"此用户名已被使用");
        }
        if(selectResult!=null)
        {
            return YiyangResult.build(500,"此用户名已被使用");
        }
        TUserInfo userInfo = null;
        try {
            userInfo = tUserInfoMapper.selectTUserInfoByTelnumber(telnumber);
        } catch (Exception e) {
            e.printStackTrace();
            YiyangResult.build(500,"此电话已被使用");
        }
        if(userInfo!=null)
        {
            return YiyangResult.build(500,"此电话已被使用");
        }
        tUserMapper.insertUser(tUser);
        UserAuthorityKey userAuthorityKey=new UserAuthorityKey();
        userAuthorityKey.setUsername(tUser.getUsername());
        userAuthorityKey.setAuthorityGroup(tUser.getAuthorityGroup());
        userAuthorityMapper.insertAuthority(userAuthorityKey);
        TUserInfo tUserInfo=new TUserInfo();
        tUserInfo.setInfoUser(tUser.getUsername());
        tUserInfo.setInfoTel(telnumber);
        tUserInfoMapper.insertTUserInfo(tUserInfo);
        switch (tUser.getAuthorityGroup())
        {
            case "parent":tParentMapper.insertTParent(tUser.getUsername()); return YiyangResult.ok();

        }
        return YiyangResult.build(500,"数据错误");
    }
}
