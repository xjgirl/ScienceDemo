package com.wzxy.science.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "sys_role_right", schema = "sciencedb")
public class SysRoleRight implements Serializable {
    private int id;
    private String roleId;
    private String rightId;

    public SysRoleRight() {
    }

    public SysRoleRight(String roleId, String rightId) {
        this.roleId = roleId;
        this.rightId = rightId;
    }

    public SysRoleRight(String roleId) {
        this.roleId = roleId;
    }

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "role_id")
    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    @Basic
    @Column(name = "right_id")
    public String getRightId() {
        return rightId;
    }

    public void setRightId(String rightId) {
        this.rightId = rightId;
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;
        SysRoleRight that = (SysRoleRight) object;
        return id == that.id &&
                Objects.equals(roleId, that.roleId) &&
                Objects.equals(rightId, that.rightId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, roleId, rightId);
    }
}
