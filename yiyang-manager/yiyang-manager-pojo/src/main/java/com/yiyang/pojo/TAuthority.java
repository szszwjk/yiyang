package com.yiyang.pojo;

public class TAuthority {
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