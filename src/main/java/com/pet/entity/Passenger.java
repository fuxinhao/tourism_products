package com.pet.entity;

public class Passenger {
    private Integer id;

    private String name;

    private String sex;

    private String phonenum;

    private Integer credentialstype;

    private String credentialsnum;

    private Integer travellertype;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum == null ? null : phonenum.trim();
    }

    public Integer getCredentialstype() {
        return credentialstype;
    }

    public void setCredentialstype(Integer credentialstype) {
        this.credentialstype = credentialstype;
    }

    public String getCredentialsnum() {
        return credentialsnum;
    }

    public void setCredentialsnum(String credentialsnum) {
        this.credentialsnum = credentialsnum == null ? null : credentialsnum.trim();
    }

    public Integer getTravellertype() {
        return travellertype;
    }

    public void setTravellertype(Integer travellertype) {
        this.travellertype = travellertype;
    }
}