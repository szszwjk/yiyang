package com.yiyang.service.impl.user;

import com.yiyang.common.jedis.JedisClient;
import com.yiyang.common.utils.JsonUtils;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.mapper.TAuthorityMapper;
import com.yiyang.mapper.TUserMapper;
import com.yiyang.pojo.TUser;
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
}
