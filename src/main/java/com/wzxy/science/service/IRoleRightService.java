package com.wzxy.science.service;

import com.wzxy.science.entity.SysRoleRight;

import java.util.List;

public interface IRoleRightService {
    /**
     * 添加角色权限
     * @param sysRoleRight
     */
    public void addRoleRight(SysRoleRight sysRoleRight);
    /**
     * 删除角色权限
     * @param id
     */
    public void delete(String id);

    /**
     * 根据角色编号查询出所有权限
     * @param roleId
     * @return
     */
    public List<SysRoleRight> findByRole(String roleId);
}
