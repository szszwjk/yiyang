package com.yiyang.pojo;

import java.io.Serializable;

public class RelationParentKey implements Serializable {
    private String rUser;

    private String pUser;

    public String getrUser() {
        return rUser;
    }

    public void setrUser(String rUser) {
        this.rUser = rUser == null ? null : rUser.trim();
    }

    public String getpUser() {
        return pUser;
    }

    public void setpUser(String pUser) {
        this.pUser = pUser == null ? null : pUser.trim();
    }
}