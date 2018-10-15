package com.yiyang.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class TData implements Serializable {
    private Integer daId;

    private String daUser;

    private String daItem;

    private Float daValue;

    private String daUnti;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date daDate;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date startTime;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getDaId() {
        return daId;
    }

    public void setDaId(Integer daId) {
        this.daId = daId;
    }

    public String getDaUser() {
        return daUser;
    }

    public void setDaUser(String daUser) {
        this.daUser = daUser == null ? null : daUser.trim();
    }

    public String getDaItem() {
        return daItem;
    }

    public void setDaItem(String daItem) {
        this.daItem = daItem == null ? null : daItem.trim();
    }

    public Float getDaValue() {
        return daValue;
    }

    public void setDaValue(Float daValue) {
        this.daValue = daValue;
    }

    public String getDaUnti() {
        return daUnti;
    }

    public void setDaUnti(String daUnti) {
        this.daUnti = daUnti == null ? null : daUnti.trim();
    }

    public Date getDaDate() {
        return daDate;
    }

    public void setDaDate(Date daDate) {
        this.daDate = daDate;
    }

    @Override
    public String toString() {
        return "TData{" +
                "daId=" + daId +
                ", daUser='" + daUser + '\'' +
                ", daItem='" + daItem + '\'' +
                ", daValue=" + daValue +
                ", daUnti='" + daUnti + '\'' +
                ", daDate=" + daDate +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                '}';
    }
}