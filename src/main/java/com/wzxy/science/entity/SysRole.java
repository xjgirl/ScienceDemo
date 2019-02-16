package com.wzxy.science.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "sys_role", schema = "sciencedb")
public class SysRole implements Serializable {
    private String roleId;
    private String roleName;
    private Integer roleSortOrder;

    public SysRole() {
    }

    public SysRole(String roleId, String roleName) {
        this.roleId = roleId;
        this.roleName = roleName;
    }

    public SysRole(String roleId, String roleName, Integer roleSortOrder) {
        this.roleId = roleId;
        this.roleName = roleName;
        this.roleSortOrder = roleSortOrder;
    }

    @Id
    @Column(name = "role_id")
    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    @Basic
    @Column(name = "role_name")
    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Basic
    @Column(name = "role_sort_order")
    public Integer getRoleSortOrder() {
        return roleSortOrder;
    }

    public void setRoleSortOrder(Integer roleSortOrder) {
        this.roleSortOrder = roleSortOrder;
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;
        SysRole sysRole = (SysRole) object;
        return Objects.equals(roleId, sysRole.roleId) &&
                Objects.equals(roleName, sysRole.roleName) &&
                Objects.equals(roleSortOrder, sysRole.roleSortOrder);
    }

    @Override
    public int hashCode() {
        return Objects.hash(roleId, roleName, roleSortOrder);
    }
}
