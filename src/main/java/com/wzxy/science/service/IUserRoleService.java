package com.wzxy.science.service;

import com.wzxy.science.entity.SysUserRole;

import java.util.List;

public interface IUserRoleService {

    /**
     * 添加用户角色
     * @param sysUserRole
     */
    public void addUserRole(SysUserRole sysUserRole);

    /**
     * 根据id删除用户角色
     * @param id
     */
    public void deleteUserRole(String id);
    /**
     * 根据用户编号查询出所有权限
     * @param userId
     * @return
     */
    public List<SysUserRole> findByUserId(String userId);
}
