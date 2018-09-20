package com.yiyang.pojo;

import java.io.Serializable;

public class TYunadmin implements Serializable {
    private Integer yId;

    private String yUser;

    private String yDepartment;

    private String yEmail;

    public Integer getyId() {
        return yId;
    }

    public void setyId(Integer yId) {
        this.yId = yId;
    }

    public String getyUser() {
        return yUser;
    }

    public void setyUser(String yUser) {
        this.yUser = yUser == null ? null : yUser.trim();
    }

    public String getyDepartment() {
        return yDepartment;
    }

    public void setyDepartment(String yDepartment) {
        this.yDepartment = yDepartment == null ? null : yDepartment.trim();
    }

    public String getyEmail() {
        return yEmail;
    }

    public void setyEmail(String yEmail) {
        this.yEmail = yEmail == null ? null : yEmail.trim();
    }
}