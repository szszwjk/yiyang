package com.yiyang.pojo;

import java.io.Serializable;

public class UserType implements Serializable{
    private String name;
    private int value ;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }
}
