package com.yiyang.pojo;

public class TService {
    private Integer sId;

    private String sUser;

    private String sName;

    private String sNumber;

    private String sCnum;

    private String sDescribe;

    private String sInfo2;

    private String sInfo3;

    private String sAddress;

    private String sFlag;

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public String getsUser() {
        return sUser;
    }

    public void setsUser(String sUser) {
        this.sUser = sUser == null ? null : sUser.trim();
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }

    public String getsNumber() {
        return sNumber;
    }

    public void setsNumber(String sNumber) {
        this.sNumber = sNumber == null ? null : sNumber.trim();
    }

    public String getsCnum() {
        return sCnum;
    }

    public void setsCnum(String sCnum) {
        this.sCnum = sCnum == null ? null : sCnum.trim();
    }

    public String getsDescribe() {
        return sDescribe;
    }

    public void setsDescribe(String sDescribe) {
        this.sDescribe = sDescribe == null ? null : sDescribe.trim();
    }

    public String getsInfo2() {
        return sInfo2;
    }

    public void setsInfo2(String sInfo2) {
        this.sInfo2 = sInfo2 == null ? null : sInfo2.trim();
    }

    public String getsInfo3() {
        return sInfo3;
    }

    public void setsInfo3(String sInfo3) {
        this.sInfo3 = sInfo3 == null ? null : sInfo3.trim();
    }

    public String getsAddress() {
        return sAddress;
    }

    public void setsAddress(String sAddress) {
        this.sAddress = sAddress == null ? null : sAddress.trim();
    }

    public String getsFlag() {
        return sFlag;
    }

    public void setsFlag(String sFlag) {
        this.sFlag = sFlag == null ? null : sFlag.trim();
    }
}