package com.yiyang.pojo;

public class TDoctor {
    private String dUser;

    private String dHname;

    private String dCnum;

    private String dInfo1;

    private String dAddress;

    public String getdUser() {
        return dUser;
    }

    public void setdUser(String dUser) {
        this.dUser = dUser == null ? null : dUser.trim();
    }

    public String getdHname() {
        return dHname;
    }

    public void setdHname(String dHname) {
        this.dHname = dHname == null ? null : dHname.trim();
    }

    public String getdCnum() {
        return dCnum;
    }

    public void setdCnum(String dCnum) {
        this.dCnum = dCnum == null ? null : dCnum.trim();
    }

    public String getdInfo1() {
        return dInfo1;
    }

    public void setdInfo1(String dInfo1) {
        this.dInfo1 = dInfo1 == null ? null : dInfo1.trim();
    }

    public String getdAddress() {
        return dAddress;
    }

    public void setdAddress(String dAddress) {
        this.dAddress = dAddress == null ? null : dAddress.trim();
    }
}