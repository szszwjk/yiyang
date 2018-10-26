package com.yiyang.pojo;

import java.io.Serializable;

public class TRelative implements Serializable {
    private String rUser;

    private String rAddress;

    private String rCnum;
    private TUserInfo tUserInfo;
    private String cName;

    public TUserInfo gettUserInfo() {
        return tUserInfo;
    }

    public void settUserInfo(TUserInfo tUserInfo) {
        this.tUserInfo = tUserInfo;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getrUser() {
        return rUser;
    }

    public void setrUser(String rUser) {
        this.rUser = rUser == null ? null : rUser.trim();
    }

    public String getrAddress() {
        return rAddress;
    }

    public void setrAddress(String rAddress) {
        this.rAddress = rAddress == null ? null : rAddress.trim();
    }

    public String getrCnum() {
        return rCnum;
    }

    public void setrCnum(String rCnum) {
        this.rCnum = rCnum == null ? null : rCnum.trim();
    }

    @Override
    public String toString() {
        return "TRelative{" +
                "rUser='" + rUser + '\'' +
                ", rAddress='" + rAddress + '\'' +
                ", rCnum='" + rCnum + '\'' +
                ", tUserInfo=" + tUserInfo +
                ", cName='" + cName + '\'' +
                '}';
    }
}