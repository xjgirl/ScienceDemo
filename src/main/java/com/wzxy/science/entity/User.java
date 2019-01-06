package com.wzxy.science.entity;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "t_user", schema = "db_science", catalog = "")
public class User {
    private String userId;
    private String userAddress;
    private Date userBirth;
    private String userEmail;
    private String userGender;
    private Integer userManagerState;
    private String userName;
    private Integer userOutState;
    private String userPassword;
    private String userPic;
    private Timestamp userRegistTime;
    private String userRname;
    private Integer userStates;
    private Integer userSuperState;
    private String userTel;

    @Id
    @Column(name = "user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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
    @Column(name = "user_birth")
    public Date getUserBirth() {
        return userBirth;
    }

    public void setUserBirth(Date userBirth) {
        this.userBirth = userBirth;
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
    @Column(name = "user_gender")
    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    @Basic
    @Column(name = "user_manager_state")
    public Integer getUserManagerState() {
        return userManagerState;
    }

    public void setUserManagerState(Integer userManagerState) {
        this.userManagerState = userManagerState;
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
    @Column(name = "user_out_state")
    public Integer getUserOutState() {
        return userOutState;
    }

    public void setUserOutState(Integer userOutState) {
        this.userOutState = userOutState;
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
    @Column(name = "user_pic")
    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    @Basic
    @Column(name = "user_regist_time")
    public Timestamp getUserRegistTime() {
        return userRegistTime;
    }

    public void setUserRegistTime(Timestamp userRegistTime) {
        this.userRegistTime = userRegistTime;
    }

    @Basic
    @Column(name = "user_rname")
    public String getUserRname() {
        return userRname;
    }

    public void setUserRname(String userRname) {
        this.userRname = userRname;
    }

    @Basic
    @Column(name = "user_states")
    public Integer getUserStates() {
        return userStates;
    }

    public void setUserStates(Integer userStates) {
        this.userStates = userStates;
    }

    @Basic
    @Column(name = "user_super_state")
    public Integer getUserSuperState() {
        return userSuperState;
    }

    public void setUserSuperState(Integer userSuperState) {
        this.userSuperState = userSuperState;
    }

    @Basic
    @Column(name = "user_tel")
    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;
        User user = (User) object;
        return Objects.equals(userId, user.userId) &&
                Objects.equals(userAddress, user.userAddress) &&
                Objects.equals(userBirth, user.userBirth) &&
                Objects.equals(userEmail, user.userEmail) &&
                Objects.equals(userGender, user.userGender) &&
                Objects.equals(userManagerState, user.userManagerState) &&
                Objects.equals(userName, user.userName) &&
                Objects.equals(userOutState, user.userOutState) &&
                Objects.equals(userPassword, user.userPassword) &&
                Objects.equals(userPic, user.userPic) &&
                Objects.equals(userRegistTime, user.userRegistTime) &&
                Objects.equals(userRname, user.userRname) &&
                Objects.equals(userStates, user.userStates) &&
                Objects.equals(userSuperState, user.userSuperState) &&
                Objects.equals(userTel, user.userTel);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, userAddress, userBirth, userEmail, userGender, userManagerState, userName, userOutState, userPassword, userPic, userRegistTime, userRname, userStates, userSuperState, userTel);
    }
}
