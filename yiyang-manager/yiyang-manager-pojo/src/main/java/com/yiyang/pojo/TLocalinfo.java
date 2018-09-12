package com.yiyang.pojo;

import java.util.Date;

public class TLocalinfo {
    private Integer lId;

    private String lUser;

    private Date lDate;

    private String lLocalx;

    private String lLocaly;

    public Integer getlId() {
        return lId;
    }

    public void setlId(Integer lId) {
        this.lId = lId;
    }

    public String getlUser() {
        return lUser;
    }

    public void setlUser(String lUser) {
        this.lUser = lUser == null ? null : lUser.trim();
    }

    public Date getlDate() {
        return lDate;
    }

    public void setlDate(Date lDate) {
        this.lDate = lDate;
    }

    public String getlLocalx() {
        return lLocalx;
    }

    public void setlLocalx(String lLocalx) {
        this.lLocalx = lLocalx == null ? null : lLocalx.trim();
    }

    public String getlLocaly() {
        return lLocaly;
    }

    public void setlLocaly(String lLocaly) {
        this.lLocaly = lLocaly == null ? null : lLocaly.trim();
    }

    @Override
    public String toString() {
        return "TLocalinfo{" +
                "lId=" + lId +
                ", lUser='" + lUser + '\'' +
                ", lDate=" + lDate +
                ", lLocalx='" + lLocalx + '\'' +
                ", lLocaly='" + lLocaly + '\'' +
                '}';
    }
}