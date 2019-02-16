package com.wzxy.science.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "sys_login_record", schema = "sciencedb")
public class SysLoginRecord implements Serializable {
    private int id;
    private String userId;
    private String userName;
    private String loginIp;
    private Timestamp loginTime;
    private String operateContent;
    private Integer operateType;

    public SysLoginRecord() {
    }

    public SysLoginRecord(String userId, String userName, String loginIp, Timestamp loginTime, String operateContent, Integer operateType) {
        this.userId = userId;
        this.userName = userName;
        this.loginIp = loginIp;
        this.loginTime = loginTime;
        this.operateContent = operateContent;
        this.operateType = operateType;
    }

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "user_name")
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Basic
    @Column(name = "login_ip")
    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    @Basic
    @Column(name = "login_time")
    public Timestamp getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Timestamp loginTime) {
        this.loginTime = loginTime;
    }

    @Basic
    @Column(name = "operate_content")
    public String getOperateContent() {
        return operateContent;
    }

    public void setOperateContent(String operateContent) {
        this.operateContent = operateContent;
    }

    @Basic
    @Column(name = "operate_type")
    public Integer getOperateType() {
        return operateType;
    }

    public void setOperateType(Integer operateType) {
        this.operateType = operateType;
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;
        SysLoginRecord that = (SysLoginRecord) object;
        return id == that.id &&
                Objects.equals(userId, that.userId) &&
                Objects.equals(userName, that.userName) &&
                Objects.equals(loginIp, that.loginIp) &&
                Objects.equals(loginTime, that.loginTime) &&
                Objects.equals(operateContent, that.operateContent) &&
                Objects.equals(operateType, that.operateType);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, userId, userName, loginIp, loginTime, operateContent, operateType);
    }
}
