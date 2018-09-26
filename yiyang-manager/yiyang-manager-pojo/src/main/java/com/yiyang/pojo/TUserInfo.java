package com.yiyang.pojo;

import java.io.Serializable;
import java.util.Date;

public class TUserInfo implements Serializable {
    private Integer infoId;

    private String infoSex;

    private String infoTel;

    private Date infoAge;

    private String infoName;

    private String infoUser;

    private String infoNation;

    private String infoMarriage;

    private  TParent tParent;

    public TParent gettParent() {
        return tParent;
    }

    public void settParent(TParent tParent) {
        this.tParent = tParent;
    }

    public Integer getInfoId() {
        return infoId;
    }

    public void setInfoId(Integer infoId) {
        this.infoId = infoId;
    }

    public String getInfoSex() {
        return infoSex;
    }

    public void setInfoSex(String infoSex) {
        this.infoSex = infoSex == null ? null : infoSex.trim();
    }

    public String getInfoTel() {
        return infoTel;
    }

    public void setInfoTel(String infoTel) {
        this.infoTel = infoTel == null ? null : infoTel.trim();
    }

    public Date getInfoAge() {
        return infoAge;
    }

    public void setInfoAge(Date infoAge) {
        this.infoAge = infoAge;
    }

    public String getInfoName() {
        return infoName;
    }

    public void setInfoName(String infoName) {
        this.infoName = infoName == null ? null : infoName.trim();
    }

    public String getInfoUser() {
        return infoUser;
    }

    public void setInfoUser(String infoUser) {
        this.infoUser = infoUser == null ? null : infoUser.trim();
    }

    public String getInfoNation() {
        return infoNation;
    }

    public void setInfoNation(String infoNation) {
        this.infoNation = infoNation == null ? null : infoNation.trim();
    }

    public String getInfoMarriage() {
        return infoMarriage;
    }

    public void setInfoMarriage(String infoMarriage) {
        this.infoMarriage = infoMarriage == null ? null : infoMarriage.trim();
    }

    @Override
    public String toString() {
        return "TUserInfo{" +
                "infoId=" + infoId +
                ", infoSex='" + infoSex + '\'' +
                ", infoTel='" + infoTel + '\'' +
                ", infoAge=" + infoAge +
                ", infoName='" + infoName + '\'' +
                ", infoUser='" + infoUser + '\'' +
                ", infoNation='" + infoNation + '\'' +
                ", infoMarriage='" + infoMarriage + '\'' +
                ", tParent=" + tParent +
                '}';
    }
}