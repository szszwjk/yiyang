package com.yiyang.pojo;

import java.io.Serializable;

public class TUser implements Serializable{
    private String username;

    private String password;
    private String authorityGroup;
    private String authorityCon;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {

        this.password = password == null ? null : password.trim();
    }

    public String getAuthorityGroup() {
        return authorityGroup;
    }

    public void setAuthorityGroup(String authorityGroup) {
        this.authorityGroup = authorityGroup;
    }

    public String getAuthorityCon() {
        return authorityCon;
    }

    public void setAuthorityCon(String authorityCon) {
        this.authorityCon = authorityCon;
    }

    @Override
    public String toString() {
        return "TUser{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", authorityGroup='" + authorityGroup + '\'' +
                ", authorityCon='" + authorityCon + '\'' +
                '}';
    }
}