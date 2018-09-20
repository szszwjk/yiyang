package com.yiyang.mapper;


import java.util.List;


import com.yiyang.pojo.UserAuthorityKey;


public interface UserAuthorityMapper {
    public void insertAuthority(UserAuthorityKey userAuthorityKey);
    public UserAuthorityKey selectAuthorityByUser(String username);
    }