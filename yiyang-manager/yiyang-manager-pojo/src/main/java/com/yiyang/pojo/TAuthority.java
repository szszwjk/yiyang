package com.yiyang.pojo;

import java.io.Serializable;

public class TAuthority implements Serializable {
    private Integer aid;
    private String authorityGroup;

    private String authorityCon;

    public Integer getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getAuthorityGroup() {
        return authorityGroup;
    }

    public void setAuthorityGroup(String authorityGroup) {
        this.authorityGroup = authorityGroup == null ? null : authorityGroup.trim();
    }

    public String getAuthorityCon() {
        return authorityCon;
    }

    public void setAuthorityCon(String authorityCon) {
        this.authorityCon = authorityCon == null ? null : authorityCon.trim();
    }
}