package com.yiyang.pojo;

import java.util.Date;

public class TOperation {
    private Integer opId;

    private String opUser;

    private String opHname;

    private String opItem;

    private Date opDate;
    
    private String opInfo1;

    private String opInfo2;

    public Integer getOpId() {
        return opId;
    }

    public void setOpId(Integer opId) {
        this.opId = opId;
    }

    public String getOpUser() {
        return opUser;
    }

    public void setOpUser(String opUser) {
        this.opUser = opUser == null ? null : opUser.trim();
    }

    public String getOpHname() {
        return opHname;
    }

    public void setOpHname(String opHname) {
        this.opHname = opHname == null ? null : opHname.trim();
    }

    public String getOpItem() {
        return opItem;
    }

    public void setOpItem(String opItem) {
        this.opItem = opItem == null ? null : opItem.trim();
    }

    public Date getOpDate() {
        return opDate;
    }

    public void setOpDate(Date opDate) {
        this.opDate = opDate;
    }


    public String getOpInfo1() {
        return opInfo1;
    }

    public void setOpInfo1(String opInfo1) {
        this.opInfo1 = opInfo1 == null ? null : opInfo1.trim();
    }

    public String getOpInfo2() {
        return opInfo2;
    }

    public void setOpInfo2(String opInfo2) {
        this.opInfo2 = opInfo2 == null ? null : opInfo2.trim();
    }

}