package com.yiyang.pojo;

import java.io.Serializable;

import java.util.List;



public class UserAuthorityKey implements Serializable {
    private String username;

    private String authorityGroup;
    private List<TAuthority> authorityList;
    private TUserInfo tUserInfo;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public TUserInfo gettUserInfo() {
        return tUserInfo;
    }

    public void settUserInfo(TUserInfo tUserInfo) {
        this.tUserInfo = tUserInfo;
    }

    public List<TAuthority> getAuthorityList() {
        return authorityList;
    }

    public void setAuthorityList(List<TAuthority> authorityList) {
        this.authorityList = authorityList;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getAuthorityGroup() {
        return authorityGroup;
    }

    public void setAuthorityGroup(String authorityGroup) {
        this.authorityGroup = authorityGroup == null ? null : authorityGroup.trim();
    }

}