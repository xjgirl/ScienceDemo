package com.wzxy.science.dao;

import com.wzxy.science.entity.SysUserRole;
import com.wzxy.science.util.Result;

import java.util.List;

public interface IUserRoleDao extends BaseDao<SysUserRole> {
    /**
     *
     * @param model
     * @param page
     * @param size
     * @return
     */
    public Result<SysUserRole> find(SysUserRole model, int page, int size);

    /**
     *
     * @param userId
     */
    public void deleteByUserId(String userId);

    /**
     *
     * @param userId
     * @return
     */
    public List<SysUserRole> findByUserId(String userId);
}
