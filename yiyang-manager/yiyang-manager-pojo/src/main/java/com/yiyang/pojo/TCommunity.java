package com.yiyang.pojo;

public class TCommunity {
    private Integer cId;

    private String cNum;

    private String cName;

    private String cTelnumber;

    private String cAdress;

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcNum() {
        return cNum;
    }

    public void setcNum(String cNum) {
        this.cNum = cNum == null ? null : cNum.trim();
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName == null ? null : cName.trim();
    }

    public String getcTelnumber() {
        return cTelnumber;
    }

    public void setcTelnumber(String cTelnumber) {
        this.cTelnumber = cTelnumber == null ? null : cTelnumber.trim();
    }

    public String getcAdress() {
        return cAdress;
    }

    public void setcAdress(String cAdress) {
        this.cAdress = cAdress == null ? null : cAdress.trim();
    }
}