package com.yiyang.pojo;

import java.io.Serializable;

public class TServiceitem implements Serializable{
    private Integer siId;

    private String siUser;

    private String siName;

    private String siLarge;

    private String siLittle;

    private String siItem;

    private String siPrice;

    private String siType;

    private String siDesc;

    public Integer getSiId() {
        return siId;
    }

    public void setSiId(Integer siId) {
        this.siId = siId;
    }

    public String getSiUser() {
        return siUser;
    }

    public void setSiUser(String siUser) {
        this.siUser = siUser == null ? null : siUser.trim();
    }

    public String getSiName() {
        return siName;
    }

    public void setSiName(String siName) {
        this.siName = siName == null ? null : siName.trim();
    }

    public String getSiLarge() {
        return siLarge;
    }

    public void setSiLarge(String siLarge) {
        this.siLarge = siLarge == null ? null : siLarge.trim();
    }

    public String getSiLittle() {
        return siLittle;
    }

    public void setSiLittle(String siLittle) {
        this.siLittle = siLittle == null ? null : siLittle.trim();
    }

    public String getSiItem() {
        return siItem;
    }

    public void setSiItem(String siItem) {
        this.siItem = siItem == null ? null : siItem.trim();
    }

    public String getSiPrice() {
        return siPrice;
    }

    public void setSiPrice(String siPrice) {
        this.siPrice = siPrice == null ? null : siPrice.trim();
    }

    public String getSiType() {
        return siType;
    }

    public void setSiType(String siType) {
        this.siType = siType == null ? null : siType.trim();
    }

    public String getSiDesc() {
        return siDesc;
    }

    public void setSiDesc(String siDesc) {
        this.siDesc = siDesc == null ? null : siDesc.trim();
    }

    @Override
    public String toString() {
        return "TServiceitem{" +
                "siId=" + siId +
                ", siUser='" + siUser + '\'' +
                ", siName='" + siName + '\'' +
                ", siLarge='" + siLarge + '\'' +
                ", siLittle='" + siLittle + '\'' +
                ", siItem='" + siItem + '\'' +
                ", siPrice='" + siPrice + '\'' +
                ", siType='" + siType + '\'' +
                ", siDesc='" + siDesc + '\'' +
                '}';
    }
}