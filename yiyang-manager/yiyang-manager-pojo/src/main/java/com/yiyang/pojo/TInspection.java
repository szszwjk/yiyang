package com.yiyang.pojo;

public class TInspection {
    private Integer iId;

    private String iUser;

    private String iHname;

    private String iItem;

    private String iInfo1;

    private String iDname;

    private String iDes;

    public Integer getiId() {
        return iId;
    }

    public void setiId(Integer iId) {
        this.iId = iId;
    }

    public String getiUser() {
        return iUser;
    }

    public void setiUser(String iUser) {
        this.iUser = iUser == null ? null : iUser.trim();
    }

    public String getiHname() {
        return iHname;
    }

    public void setiHname(String iHname) {
        this.iHname = iHname == null ? null : iHname.trim();
    }

    public String getiItem() {
        return iItem;
    }

    public void setiItem(String iItem) {
        this.iItem = iItem == null ? null : iItem.trim();
    }

    public String getiInfo1() {
        return iInfo1;
    }

    public void setiInfo1(String iInfo1) {
        this.iInfo1 = iInfo1 == null ? null : iInfo1.trim();
    }

    public String getiDname() {
        return iDname;
    }

    public void setiDname(String iDname) {
        this.iDname = iDname == null ? null : iDname.trim();
    }

    public String getiDes() {
        return iDes;
    }

    public void setiDes(String iDes) {
        this.iDes = iDes == null ? null : iDes.trim();
    }
}