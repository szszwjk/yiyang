package com.yiyang.pojo;

import java.io.Serializable;

public class HServiceList implements Serializable{
    private String psNumber;
    private String psUname;
    private String sName;
    private String psItem;
    private String psTime;
    private String psTotime;
    private String psAddres;
    private String siPrice;
    private String psPrice;
    private String psDesc;
    private String infoName;
    private String infoTel;
    private String psFlag;

    public String getPsFlag() {
        return psFlag;
    }

    public void setPsFlag(String psFlag) {
        this.psFlag = psFlag;
    }

    public String getPsNumber() {
        return psNumber;
    }

    public void setPsNumber(String psNumber) {
        this.psNumber = psNumber;
    }

    public String getPsUname() {
        return psUname;
    }

    public void setPsUname(String psUname) {
        this.psUname = psUname;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getPsItem() {
        return psItem;
    }

    public void setPsItem(String psItem) {
        this.psItem = psItem;
    }

    public String getPsTime() {
        return psTime;
    }

    public void setPsTime(String psTime) {
        this.psTime = psTime;
    }

    public String getPsTotime() {
        return psTotime;
    }

    public void setPsTotime(String psTotime) {
        this.psTotime = psTotime;
    }

    public String getPsAddres() {
        return psAddres;
    }

    public void setPsAddres(String psAddres) {
        this.psAddres = psAddres;
    }

    public String getSiPrice() {
        return siPrice;
    }

    public void setSiPrice(String siPrice) {
        this.siPrice = siPrice;
    }

    public String getPsPrice() {
        return psPrice;
    }

    public void setPsPrice(String psPrice) {
        this.psPrice = psPrice;
    }

    public String getPsDesc() {
        return psDesc;
    }

    public void setPsDesc(String psDesc) {
        this.psDesc = psDesc;
    }

    public String getInfoName() {
        return infoName;
    }

    public void setInfoName(String infoName) {
        this.infoName = infoName;
    }

    public String getInfoTel() {
        return infoTel;
    }

    public void setInfoTel(String infoTel) {
        this.infoTel = infoTel;
    }

    @Override
    public String toString() {
        return "HServiceList{" +
                "psNumber='" + psNumber + '\'' +
                ", psUname='" + psUname + '\'' +
                ", sName='" + sName + '\'' +
                ", psItem='" + psItem + '\'' +
                ", psTime='" + psTime + '\'' +
                ", psTotime='" + psTotime + '\'' +
                ", psAddres='" + psAddres + '\'' +
                ", siPrice='" + siPrice + '\'' +
                ", psPrice='" + psPrice + '\'' +
                ", psDesc='" + psDesc + '\'' +
                ", infoName='" + infoName + '\'' +
                ", infoTel='" + infoTel + '\'' +
                ", psFalg='" + psFlag + '\'' +
                '}';
    }
}
