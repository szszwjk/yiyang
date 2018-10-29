package com.yiyang.mapper;


import java.util.List;


import com.yiyang.pojo.TAuthority;
import com.yiyang.pojo.UserAuthorityKey;
import com.yiyang.pojo.UserType;


public interface UserAuthorityMapper {
    public void insertAuthority(UserAuthorityKey userAuthorityKey);
    public UserAuthorityKey selectAuthorityByUser(String username);
    public List<UserType> getUserType();
    public List<UserAuthorityKey> getAllUser(UserAuthorityKey userAuthorityKey);
    public List<UserAuthorityKey> getUserAuthorityKeyByUser(String username);
    public void deleteUserAuthority(String username);
    public void addUserAuthority(List<UserAuthorityKey> list);
    public List<TAuthority> getAuthorityByUser(String username);
    }