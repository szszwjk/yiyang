package com.yiyang.service.yunadmin;

import com.yiyang.common.utils.YiyangPageResult;
import com.yiyang.common.utils.YiyangResult;
import com.yiyang.pojo.TAuthority;
import com.yiyang.pojo.TYunadmin;
import com.yiyang.pojo.UserAuthorityKey;
import com.yiyang.pojo.UserType;

import java.util.List;

public interface AdminService {
    public TYunadmin getAdminInfo(String username);
    public YiyangResult updateInfo(TYunadmin tYunadmin);
    public List<UserType> getUserType();
    public List<UserType> getComunity();
    public YiyangPageResult getAllUser(Integer page, Integer rows, UserAuthorityKey userAuthorityKey);
    public List<UserAuthorityKey> getUserAuthorityKeyByUser(String username);
    public YiyangResult updateUserAuthority(List<UserAuthorityKey> userAuthorityKeys,String username);
    public YiyangPageResult getAllAuthority(Integer page, Integer rows, TAuthority tAuthority);
    public YiyangResult updateAuthority(TAuthority tAuthority);
    public YiyangResult deleteAuthority(TAuthority tAuthority);
    public YiyangResult addAuthority(TAuthority tAuthority);
}
