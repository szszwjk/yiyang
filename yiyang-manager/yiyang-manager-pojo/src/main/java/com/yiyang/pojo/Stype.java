package com.yiyang.pojo;

public class Stype {
    private  String  type;
    private  int flag;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "Stype{" +
                "type='" + type + '\'' +
                ", flag=" + flag +
                '}';
    }

    public Stype() {

    }
    public Stype(String type,int flag) {
        this.type = type;
        this.flag = flag;
    }

}
