package com.yiyang.pojo;

import java.io.Serializable;
import java.util.Date;

public class TMedical implements Serializable {
    private Integer mId;

    private String mUser;

    private String mHname;

    private String mInfo1;

    private String mInfo2;

    private String mNum;

    private Date mIndate;

    private Date mOutdate;

    private String mDesc;

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public String getmUser() {
        return mUser;
    }

    public void setmUser(String mUser) {
        this.mUser = mUser == null ? null : mUser.trim();
    }

    public String getmHname() {
        return mHname;
    }

    public void setmHname(String mHname) {
        this.mHname = mHname == null ? null : mHname.trim();
    }

    public String getmInfo1() {
        return mInfo1;
    }

    public void setmInfo1(String mInfo1) {
        this.mInfo1 = mInfo1 == null ? null : mInfo1.trim();
    }

    public String getmInfo2() {
        return mInfo2;
    }

    public void setmInfo2(String mInfo2) {
        this.mInfo2 = mInfo2 == null ? null : mInfo2.trim();
    }

    public String getmNum() {
        return mNum;
    }

    public void setmNum(String mNum) {
        this.mNum = mNum == null ? null : mNum.trim();
    }

    public Date getmIndate() {
        return mIndate;
    }

    public void setmIndate(Date mIndate) {
        this.mIndate = mIndate;
    }

    public Date getmOutdate() {
        return mOutdate;
    }

    public void setmOutdate(Date mOutdate) {
        this.mOutdate = mOutdate;
    }

    public String getmDesc() {
        return mDesc;
    }

    public void setmDesc(String mDesc) {
        this.mDesc = mDesc == null ? null : mDesc.trim();
    }
}