package com.yiyang.pojo;

import java.io.Serializable;

public class TComadmin implements Serializable {
    private Integer caId;

    private String caUser;

    private String caDepartment;

    private String caCnum;

    public Integer getCaId() {
        return caId;
    }

    public void setCaId(Integer caId) {
        this.caId = caId;
    }

    public String getCaUser() {
        return caUser;
    }

    public void setCaUser(String caUser) {
        this.caUser = caUser == null ? null : caUser.trim();
    }

    public String getCaDepartment() {
        return caDepartment;
    }

    public void setCaDepartment(String caDepartment) {
        this.caDepartment = caDepartment == null ? null : caDepartment.trim();
    }

    public String getCaCnum() {
        return caCnum;
    }

    public void setCaCnum(String caCnum) {
        this.caCnum = caCnum == null ? null : caCnum.trim();
    }
}