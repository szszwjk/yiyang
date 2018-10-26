package com.yiyang.pojo;

import java.io.Serializable;
import java.util.Date;

public class TConsult implements Serializable {
    private Integer cId;

    private String cUser;

    private String cDuser;

    private String cFlag;

    private String cDesc;

    private String cAnswer;

    private String cEvaluate;

    private Date cDate;

    private Date date;
    private TUserInfo consultUser;
    private TUserInfo doctorUser;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public TUserInfo getConsultUser() {
        return consultUser;
    }

    public void setConsultUser(TUserInfo consultUser) {
        this.consultUser = consultUser;
    }

    public TUserInfo getDoctorUser() {
        return doctorUser;
    }

    public void setDoctorUser(TUserInfo doctorUser) {
        this.doctorUser = doctorUser;
    }

    public Date getcDate() {
        return cDate;
    }


    public void setcDate(Date cDate) {
        this.cDate = cDate;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcUser() {
        return cUser;
    }

    public void setcUser(String cUser) {
        this.cUser = cUser == null ? null : cUser.trim();
    }

    public String getcDuser() {
        return cDuser;
    }

    public void setcDuser(String cDuser) {
        this.cDuser = cDuser == null ? null : cDuser.trim();
    }

    public String getcFlag() {
        return cFlag;
    }

    public void setcFlag(String cFlag) {
        this.cFlag = cFlag == null ? null : cFlag.trim();
    }


    public String getcDesc() {
        return cDesc;
    }

    public void setcDesc(String cDesc) {
        this.cDesc = cDesc == null ? null : cDesc.trim();
    }

    public String getcAnswer() {
        return cAnswer;
    }

    public void setcAnswer(String cAnswer) {
        this.cAnswer = cAnswer == null ? null : cAnswer.trim();
    }

    public String getcEvaluate() {
        return cEvaluate;
    }

    public void setcEvaluate(String cEvaluate) {
        this.cEvaluate = cEvaluate == null ? null : cEvaluate.trim();
    }

}