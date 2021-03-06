package com.yiyang.pojo;

import java.io.Serializable;

public class ServiceDesc implements Serializable{
//    SELECT a.siName,b.sAddress,c.infoTel,a.siItem,a.siPrice,a.siType,b.sInfo3,a.siDesc,b.sNumber
//    FROM tserviceitem a LEFT JOIN tservice b ON a.siUser=b.sUser LEFT JOIN tuserinfo c ON a.siUser=c.infoUser where a.siId=;
    private String siName;
    private String sAddress;
    private String infoTel;
    private String siItem;
    private String siPrice;
    private String siType;
    private String sInfo3;
    private String siDesc;
    private String sNumber;
    private String sUser;
    private String siPriceAndType;

    public String getSiPriceAndType() {
        switch (siType)
        {
            case "1": siPriceAndType=siPrice+"/小时";break;
            case "2":siPriceAndType=siPrice+"/次";break;
            case "3":siPriceAndType="免费";break;
        }
        return siPriceAndType;
    }

    public void setSiPriceAndType(String siPriceAndType) {
        this.siPriceAndType = siPriceAndType;
    }

    public String getsUser() {
        return sUser;
    }

    public void setsUser(String sUser) {
        this.sUser = sUser;
    }

    public String getSiName() {
        return siName;
    }

    public void setSiName(String siName) {
        this.siName = siName;
    }

    public String getsAddress() {
        return sAddress;
    }

    public void setsAddress(String sAddress) {
        this.sAddress = sAddress;
    }

    public String getInfoTel() {
        return infoTel;
    }

    public void setInfoTel(String infoTel) {
        this.infoTel = infoTel;
    }

    public String getSiItem() {
        return siItem;
    }

    public void setSiItem(String siItem) {
        this.siItem = siItem;
    }

    public String getSiPrice() {

        return siPrice;
    }

    public void setSiPrice(String siPrice) {
        this.siPrice = siPrice;
    }

    public String getSiType() {
        return siType;
    }

    public void setSiType(String siType) {
        this.siType = siType;
    }

    public String getsInfo3() {
        return sInfo3;
    }

    public void setsInfo3(String sInfo3) {
        this.sInfo3 = sInfo3;
    }

    public String getSiDesc() {
        return siDesc;
    }

    public void setSiDesc(String siDesc) {
        this.siDesc = siDesc;
    }

    public String getsNumber() {
        return sNumber;
    }

    public void setsNumber(String sNumber) {
        this.sNumber = sNumber;
    }

    @Override
    public String toString() {
        return "ServiceDesc{" +
                "siName='" + siName + '\'' +
                ", sAddress='" + sAddress + '\'' +
                ", infoTel='" + infoTel + '\'' +
                ", siItem='" + siItem + '\'' +
                ", siPrice='" + siPrice + '\'' +
                ", siType='" + siType + '\'' +
                ", sInfo3='" + sInfo3 + '\'' +
                ", siDesc='" + siDesc + '\'' +
                ", sNumber='" + sNumber + '\'' +
                ", sUser='" + sUser + '\'' +
                ", siPriceAndType='" + siPriceAndType + '\'' +
                '}';
    }
}
