package com.yiyang.service.user;

import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.TUser;

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
}
