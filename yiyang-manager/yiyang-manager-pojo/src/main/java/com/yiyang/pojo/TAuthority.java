package com.yiyang.pojo;

import java.io.Serializable;

public class TAuthority implements Serializable {
    private String authorityGroup;

    private String authorityCon;

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