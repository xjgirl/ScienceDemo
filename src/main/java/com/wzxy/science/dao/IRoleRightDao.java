package com.wzxy.science.dao;

import com.wzxy.science.entity.SysRoleRight;

import java.util.List;

public interface IRoleRightDao extends BaseDao<SysRoleRight> {

    /**
     *
     * @param roleId
     */
    public void deleteByRoleId(String roleId);

    /**
     *
     * @param roleId
     * @return
     */
    public List<SysRoleRight> findByRoleId(String roleId);
}
