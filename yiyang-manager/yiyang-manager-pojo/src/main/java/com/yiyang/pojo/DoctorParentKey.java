package com.yiyang.pojo;

import java.io.Serializable;


public class DoctorParentKey implements Serializable{


    private String pUser;

    private String dUser;

    public String getpUser() {
        return pUser;
    }

    public void setpUser(String pUser) {
        this.pUser = pUser == null ? null : pUser.trim();
    }

    public String getdUser() {
        return dUser;
    }

    public void setdUser(String dUser) {
        this.dUser = dUser == null ? null : dUser.trim();
    }
}