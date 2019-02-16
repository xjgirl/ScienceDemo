package com.wzxy.science.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "sys_right", schema = "sciencedb")
public class SysRight implements Serializable {
    private String rightId;
    private String rightName;
    private String resourcePath;
    private String rightType;
    private Integer rightSortOrder;

    public SysRight() {
    }

    public SysRight(String rightName, String resourcePath, String rightType, Integer rightSortOrder) {
        this.rightName = rightName;
        this.resourcePath = resourcePath;
        this.rightType = rightType;
        this.rightSortOrder = rightSortOrder;
    }

    @Id
    @Column(name = "right_id")
    public String getRightId() {
        return rightId;
    }

    public void setRightId(String rightId) {
        this.rightId = rightId;
    }

    @Basic
    @Column(name = "right_name")
    public String getRightName() {
        return rightName;
    }

    public void setRightName(String rightName) {
        this.rightName = rightName;
    }

    @Basic
    @Column(name = "resource_path")
    public String getResourcePath() {
        return resourcePath;
    }

    public void setResourcePath(String resourcePath) {
        this.resourcePath = resourcePath;
    }

    @Basic
    @Column(name = "right_type")
    public String getRightType() {
        return rightType;
    }

    public void setRightType(String rightType) {
        this.rightType = rightType;
    }

    @Basic
    @Column(name = "right_sort_order")
    public Integer getRightSortOrder() {
        return rightSortOrder;
    }

    public void setRightSortOrder(Integer rightSortOrder) {
        this.rightSortOrder = rightSortOrder;
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;
        SysRight sysRight = (SysRight) object;
        return Objects.equals(rightId, sysRight.rightId) &&
                Objects.equals(rightName, sysRight.rightName) &&
                Objects.equals(resourcePath, sysRight.resourcePath) &&
                Objects.equals(rightType, sysRight.rightType) &&
                Objects.equals(rightSortOrder, sysRight.rightSortOrder);
    }

    @Override
    public int hashCode() {
        return Objects.hash(rightId, rightName, resourcePath, rightType, rightSortOrder);
    }
}
