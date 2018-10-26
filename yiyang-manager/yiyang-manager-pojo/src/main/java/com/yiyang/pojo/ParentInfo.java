package com.yiyang.pojo;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

public class ParentInfo implements Serializable {
//     <tr> <td rowspan="4"> 照片</td><td>性别:${item.infoSex}</td><td>身份证:${item.pIdnum}</td></tr>
//                        <tr> <td>联系方式:${item.infoTel}</td><td>出生地:${item.pBirthplace}</td></tr>
//                        <tr> <td>居住地:${item.pAddress}</td><td></td></tr>
//                        <tr> <td>所属社区:${item.cName}</td><td>社保编号:${item.pCno}</td></tr>
//                        <tr> <td>姓名:${item.infoName}</td><td>有无过敏史:${item.info1}</td><td>有无手术史:${item.info3}</td></tr>
//                        <tr><td>年龄:${item.infoAge}</td> <td>有无外伤:${item.info2}</td><td>有无遗传病:${item.info4}</td></tr>
    private String infoSex;
    private String pIdnum;
    private String infoTel;
    private String pBirthplace;
    private String pAddress;
    private String cName;
    private String pCno;
    private String infoName;
    private String pInfo1;
    private String pInfo2;
    private String pInfo3;
    private String pInfo4;
    private Date infoAge;
    private String age;

    public String getAge() {
        Date birthday=infoAge;
        Calendar cal = Calendar.getInstance();
        if (cal.before(birthday)) {
            throw new IllegalArgumentException(
                    "The birthDay is before Now.It's unbelievable!");
        }
        int yearNow = cal.get(Calendar.YEAR);
        int monthNow = cal.get(Calendar.MONTH) + 1;
        int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH);
        cal.setTime(birthday);
        int yearBirth = cal.get(Calendar.YEAR);
        int monthBirth = cal.get(Calendar.MONTH) + 1;
        int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);
        int age = yearNow - yearBirth;
        if (monthNow <= monthBirth) {
            if (monthNow == monthBirth) {
                // monthNow==monthBirth
                if (dayOfMonthNow < dayOfMonthBirth) {
                    age--;
                }
            } else {
                // monthNow>monthBirth
                age--;
            }
        }
        return age+"";
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getpInfo1() {
        return pInfo1;
    }

    public void setpInfo1(String pInfo1) {
        this.pInfo1 = pInfo1;
    }

    public String getpInfo2() {
        return pInfo2;
    }

    public void setpInfo2(String pInfo2) {
        this.pInfo2 = pInfo2;
    }

    public String getpInfo3() {
        return pInfo3;
    }

    public void setpInfo3(String pInfo3) {
        this.pInfo3 = pInfo3;
    }

    public String getpInfo4() {
        return pInfo4;
    }

    public void setpInfo4(String pInfo4) {
        this.pInfo4 = pInfo4;
    }

    public String getInfoSex() {
        return infoSex;
    }

    public void setInfoSex(String infoSex) {
        this.infoSex = infoSex;
    }

    public String getpIdnum() {
        return pIdnum;
    }

    public void setpIdnum(String pIdnum) {
        this.pIdnum = pIdnum;
    }

    public String getInfoTel() {
        return infoTel;
    }

    public void setInfoTel(String infoTel) {
        this.infoTel = infoTel;
    }

    public String getpBirthplace() {
        return pBirthplace;
    }

    public void setpBirthplace(String pBirthplace) {
        this.pBirthplace = pBirthplace;
    }

    public String getpAddress() {
        return pAddress;
    }

    public void setpAddress(String pAddress) {
        this.pAddress = pAddress;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getpCno() {
        return pCno;
    }

    public void setpCno(String pCno) {
        this.pCno = pCno;
    }

    public String getInfoName() {
        return infoName;
    }

    public void setInfoName(String infoName) {
        this.infoName = infoName;
    }


    public Date getInfoAge() {
        return infoAge;
    }

    public void setInfoAge(Date infoAge) {
        this.infoAge = infoAge;
    }
}
