package com.yiyang.pojo;

import java.io.Serializable;
import java.util.Date;

public class TPreremind implements Serializable {
    private Integer prId;

    private String prUser;

    private String prItem;

    private Float prValue;

    private String prUnit;

    private Date prTime;

    private String prFlag;
    private String infoName;

    public String getInfoName() {
        return infoName;
    }

    public void setInfoName(String infoName) {
        this.infoName = infoName;
    }

    public Integer getPrId() {
        return prId;
    }

    public void setPrId(Integer prId) {
        this.prId = prId;
    }

    public String getPrUser() {
        return prUser;
    }

    public void setPrUser(String prUser) {
        this.prUser = prUser == null ? null : prUser.trim();
    }

    public String getPrItem() {
        return prItem;
    }

    public void setPrItem(String prItem) {
        this.prItem = prItem == null ? null : prItem.trim();
    }

    public Float getPrValue() {
        return prValue;
    }

    public void setPrValue(Float prValue) {
        this.prValue = prValue;
    }

    public String getPrUnit() {
        return prUnit;
    }

    public void setPrUnit(String prUnit) {
        this.prUnit = prUnit == null ? null : prUnit.trim();
    }

    public Date getPrTime() {
        return prTime;
    }

    public void setPrTime(Date prTime) {
        this.prTime = prTime;
    }

    public String getPrFlag() {
        return prFlag;
    }

    public void setPrFlag(String prFlag) {
        this.prFlag = prFlag == null ? null : prFlag.trim();
    }
}