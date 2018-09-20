package com.yiyang.service.user;

import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.TAuthority;
import com.yiyang.pojo.TUser;
import com.yiyang.pojo.UserAuthorityKey;

public interface UserService {
    /**
     * 根据用户信息查询
     * @param tUser
     * @return
     */
    YiyangResult userLogin(TUser tUser);

    /**
     * 根据用户信息登录
     * @param tUser
     * @return
     */
    TUser selectAuthorityByUser(TUser tUser);

    /**
     * 用户注册
     * @param tUser
     * @param telnumber
     * @return
     */
    YiyangResult registerUser(TUser tUser,String telnumber);
    UserAuthorityKey selectAuthorityByUser(String username);
}
