package com.yiyang.pojo;

import java.io.Serializable;

public class TParent implements Serializable {
    private String pUser;

    private String pIdnum;

    private String pBirthplace;

    private String pAddress;

    private String pCnum;

    private String pCno;

    private String pInfo1;

    private String pInfo2;

    private String pInfo3;

    private String pInfo4;

    private String pNationality;

    private String pBlood;

    private String pEducational;

    public String getpUser() {
        return pUser;
    }

    public void setpUser(String pUser) {
        this.pUser = pUser == null ? null : pUser.trim();
    }

    public String getpIdnum() {
        return pIdnum;
    }

    public void setpIdnum(String pIdnum) {
        this.pIdnum = pIdnum == null ? null : pIdnum.trim();
    }

    public String getpBirthplace() {
        return pBirthplace;
    }

    public void setpBirthplace(String pBirthplace) {
        this.pBirthplace = pBirthplace == null ? null : pBirthplace.trim();
    }

    public String getpAddress() {
        return pAddress;
    }

    public void setpAddress(String pAddress) {
        this.pAddress = pAddress == null ? null : pAddress.trim();
    }

    public String getpCnum() {
        return pCnum;
    }

    public void setpCnum(String pCnum) {
        this.pCnum = pCnum == null ? null : pCnum.trim();
    }

    public String getpCno() {
        return pCno;
    }

    public void setpCno(String pCno) {
        this.pCno = pCno == null ? null : pCno.trim();
    }

    public String getpInfo1() {
        return pInfo1;
    }

    public void setpInfo1(String pInfo1) {
        this.pInfo1 = pInfo1 == null ? null : pInfo1.trim();
    }

    public String getpInfo2() {
        return pInfo2;
    }

    public void setpInfo2(String pInfo2) {
        this.pInfo2 = pInfo2 == null ? null : pInfo2.trim();
    }

    public String getpInfo3() {
        return pInfo3;
    }

    public void setpInfo3(String pInfo3) {
        this.pInfo3 = pInfo3 == null ? null : pInfo3.trim();
    }

    public String getpInfo4() {
        return pInfo4;
    }

    public void setpInfo4(String pInfo4) {
        this.pInfo4 = pInfo4 == null ? null : pInfo4.trim();
    }

    public String getpNationality() {
        return pNationality;
    }

    public void setpNationality(String pNationality) {
        this.pNationality = pNationality == null ? null : pNationality.trim();
    }

    public String getpBlood() {
        return pBlood;
    }

    public void setpBlood(String pBlood) {
        this.pBlood = pBlood == null ? null : pBlood.trim();
    }

    public String getpEducational() {
        return pEducational;
    }

    public void setpEducational(String pEducational) {
        this.pEducational = pEducational == null ? null : pEducational.trim();
    }
}