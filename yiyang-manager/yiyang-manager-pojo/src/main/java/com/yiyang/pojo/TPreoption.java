package com.yiyang.pojo;

public class TPreoption {
    private Integer poId;

    private String poUser;

    private String poItem;

    private Float poMax;

    private Float poMin;

    private String poUnit;

    public Integer getPoId() {
        return poId;
    }

    public void setPoId(Integer poId) {
        this.poId = poId;
    }

    public String getPoUser() {
        return poUser;
    }

    public void setPoUser(String poUser) {
        this.poUser = poUser == null ? null : poUser.trim();
    }

    public String getPoItem() {
        return poItem;
    }

    public void setPoItem(String poItem) {
        this.poItem = poItem == null ? null : poItem.trim();
    }

    public Float getPoMax() {
        return poMax;
    }

    public void setPoMax(Float poMax) {
        this.poMax = poMax;
    }

    public Float getPoMin() {
        return poMin;
    }

    public void setPoMin(Float poMin) {
        this.poMin = poMin;
    }

    public String getPoUnit() {
        return poUnit;
    }

    public void setPoUnit(String poUnit) {
        this.poUnit = poUnit == null ? null : poUnit.trim();
    }
}