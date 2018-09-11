package com.yiyang.pojo;

import java.util.Date;

public class TPreservice {
    private Integer psId;

    private String psUser;

    private String psNumber;

    private String psUname;

    private String psItem;

    private Float psPrice;

    private Date psTime;

    private Date psTotime;

    private String psFlag;

    private String psTelnumber;

    private String psAddres;

    private String psDesc;

    public Integer getPsId() {
        return psId;
    }

    public void setPsId(Integer psId) {
        this.psId = psId;
    }

    public String getPsUser() {
        return psUser;
    }

    public void setPsUser(String psUser) {
        this.psUser = psUser == null ? null : psUser.trim();
    }

    public String getPsNumber() {
        return psNumber;
    }

    public void setPsNumber(String psNumber) {
        this.psNumber = psNumber == null ? null : psNumber.trim();
    }

    public String getPsUname() {
        return psUname;
    }

    public void setPsUname(String psUname) {
        this.psUname = psUname == null ? null : psUname.trim();
    }

    public String getPsItem() {
        return psItem;
    }

    public void setPsItem(String psItem) {
        this.psItem = psItem == null ? null : psItem.trim();
    }

    public Float getPsPrice() {
        return psPrice;
    }

    public void setPsPrice(Float psPrice) {
        this.psPrice = psPrice;
    }

    public Date getPsTime() {
        return psTime;
    }

    public void setPsTime(Date psTime) {
        this.psTime = psTime;
    }

    public Date getPsTotime() {
        return psTotime;
    }

    public void setPsTotime(Date psTotime) {
        this.psTotime = psTotime;
    }

    public String getPsFlag() {
        return psFlag;
    }

    public void setPsFlag(String psFlag) {
        this.psFlag = psFlag == null ? null : psFlag.trim();
    }

    public String getPsTelnumber() {
        return psTelnumber;
    }

    public void setPsTelnumber(String psTelnumber) {
        this.psTelnumber = psTelnumber == null ? null : psTelnumber.trim();
    }

    public String getPsAddres() {
        return psAddres;
    }

    public void setPsAddres(String psAddres) {
        this.psAddres = psAddres == null ? null : psAddres.trim();
    }

    public String getPsDesc() {
        return psDesc;
    }

    public void setPsDesc(String psDesc) {
        this.psDesc = psDesc == null ? null : psDesc.trim();
    }
}