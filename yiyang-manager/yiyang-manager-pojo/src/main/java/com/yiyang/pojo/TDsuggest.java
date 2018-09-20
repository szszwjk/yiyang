package com.yiyang.pojo;

import java.io.Serializable;
import java.util.Date;

public class TDsuggest implements Serializable {
    private Integer dsId;

    private String dsDuser;

    private String dsPuser;

    private Date dsDate;

    private String dsItem;

    private String dsSuggest;

    public Integer getDsId() {
        return dsId;
    }

    public void setDsId(Integer dsId) {
        this.dsId = dsId;
    }

    public String getDsDuser() {
        return dsDuser;
    }

    public void setDsDuser(String dsDuser) {
        this.dsDuser = dsDuser == null ? null : dsDuser.trim();
    }

    public String getDsPuser() {
        return dsPuser;
    }

    public void setDsPuser(String dsPuser) {
        this.dsPuser = dsPuser == null ? null : dsPuser.trim();
    }

    public Date getDsDate() {
        return dsDate;
    }

    public void setDsDate(Date dsDate) {
        this.dsDate = dsDate;
    }

    public String getDsItem() {
        return dsItem;
    }

    public void setDsItem(String dsItem) {
        this.dsItem = dsItem == null ? null : dsItem.trim();
    }

    public String getDsSuggest() {
        return dsSuggest;
    }

    public void setDsSuggest(String dsSuggest) {
        this.dsSuggest = dsSuggest == null ? null : dsSuggest.trim();
    }
}