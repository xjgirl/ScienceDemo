package com.wzxy.science.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "sys_user", schema = "sciencedb")
public class SysUser implements Serializable {
    private Integer id;
    private String userId;
    private String userName;
    private String userPassword;
    private String userTelephone;
    private String userEmail;
    private String userRealName;
    private Integer userSex;
    private Integer userAge;
    private Integer userType;
    private String userAddress;
    private String userQq;
    private Integer studentType;
    private String studentClass;

    public SysUser() {
    }

    public SysUser(String userId, String userName, String userPassword, Integer userType) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userType = userType;
    }

    public SysUser(String userId, String userName, String userPassword, String userTelephone, String userEmail, String userRealName, Integer userSex, Integer userAge, Integer userType, String userAddress, String userQq, Integer studentType, String studentClass) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userTelephone = userTelephone;
        this.userEmail = userEmail;
        this.userRealName = userRealName;
        this.userSex = userSex;
        this.userAge = userAge;
        this.userType = userType;
        this.userAddress = userAddress;
        this.userQq = userQq;
        this.studentType = studentType;
        this.studentClass = studentClass;
    }

    @Basic
    @Column
    public Integer getStudentType() {
        return studentType;
    }

    public void setStudentType(Integer studentType) {
        this.studentType = studentType;
    }

    @Basic
    @Column
    public String getStudentClass() {
        return studentClass;
    }

    public void setStudentClass(String studentClass) {
        this.studentClass = studentClass;
    }

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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
    @Column(name = "user_password")
    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    @Basic
    @Column(name = "user_telephone")
    public String getUserTelephone() {
        return userTelephone;
    }

    public void setUserTelephone(String userTelephone) {
        this.userTelephone = userTelephone;
    }

    @Basic
    @Column(name = "user_email")
    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    @Basic
    @Column(name = "user_real_name")
    public String getUserRealName() {
        return userRealName;
    }

    public void setUserRealName(String userRealName) {
        this.userRealName = userRealName;
    }

    @Basic
    @Column(name = "user_sex")
    public Integer getUserSex() {
        return userSex;
    }

    public void setUserSex(Integer userSex) {
        this.userSex = userSex;
    }

    @Basic
    @Column(name = "user_age")
    public Integer getUserAge() {
        return userAge;
    }

    public void setUserAge(Integer userAge) {
        this.userAge = userAge;
    }

    @Basic
    @Column(name = "user_type")
    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    @Basic
    @Column(name = "user_address")
    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    @Basic
    @Column(name = "user_qq")
    public String getUserQq() {
        return userQq;
    }

    public void setUserQq(String userQq) {
        this.userQq = userQq;
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;
        SysUser sysUser = (SysUser) object;
        return id == sysUser.id &&
                userType == sysUser.userType &&
                Objects.equals(userId, sysUser.userId) &&
                Objects.equals(userName, sysUser.userName) &&
                Objects.equals(userPassword, sysUser.userPassword) &&
                Objects.equals(userTelephone, sysUser.userTelephone) &&
                Objects.equals(userEmail, sysUser.userEmail) &&
                Objects.equals(userRealName, sysUser.userRealName) &&
                Objects.equals(userSex, sysUser.userSex) &&
                Objects.equals(userAge, sysUser.userAge) &&
                Objects.equals(userAddress, sysUser.userAddress) &&
                Objects.equals(userQq, sysUser.userQq);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, userId, userName, userPassword, userTelephone, userEmail, userRealName, userSex, userAge, userType, userAddress, userQq);
    }
}
