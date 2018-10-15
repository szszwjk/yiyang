package com.yiyang.pojo;

import java.io.Serializable;

public class TDoctor implements Serializable {
    private String dUser;

    private String dHname;

    private String dCnum;

    private String dInfo1;

    private String dAddress;
    private String infoName;
    private String infoImg;
    private String infoTel;

    public String getInfoTel() {
        return infoTel;
    }

    public void setInfoTel(String infoTel) {
        this.infoTel = infoTel;
    }

    public String getInfoImg() {
        return infoImg;
    }

    public void setInfoImg(String infoImg) {
        this.infoImg = infoImg;
    }

    public String getInfoName() {
        return infoName;
    }

    public void setInfoName(String infoName) {
        this.infoName = infoName;
    }

    public String getdUser() {
        return dUser;
    }

    public void setdUser(String dUser) {
        this.dUser = dUser;
    }

    public String getdHname() {
        return dHname;
    }

    public void setdHname(String dHname) {
        this.dHname = dHname ;
    }

    public String getdCnum() {
        return dCnum;
    }

    public void setdCnum(String dCnum) {
        this.dCnum = dCnum ;
    }

    public String getdInfo1() {
        return dInfo1;
    }

    public void setdInfo1(String dInfo1) {
        this.dInfo1 = dInfo1 ;
    }

    public String getdAddress() {
        return dAddress;
    }

    public void setdAddress(String dAddress) {
        this.dAddress = dAddress ;
    }

    @Override
    public String toString() {
        return "TDoctor{" +
                "dUser='" + dUser + '\'' +
                ", dHname='" + dHname + '\'' +
                ", dCnum='" + dCnum + '\'' +
                ", dInfo1='" + dInfo1 + '\'' +
                ", dAddress='" + dAddress + '\'' +
                '}';
    }
}