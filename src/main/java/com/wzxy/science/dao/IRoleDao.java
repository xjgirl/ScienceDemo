package com.wzxy.science.dao;

import com.wzxy.science.entity.SysRight;
import com.wzxy.science.entity.SysRole;
import com.wzxy.science.util.Result;

public interface IRoleDao extends BaseDao<SysRole> {
    /**
     *
     * @param model
     * @param page
     * @param size
     * @return
     */
    public Result<SysRole> find(SysRole model, int page, int size);

    /**
     *
     * @param sysRight
     * @return
     */
    public Result<SysRight> findRightAll(SysRight sysRight);
}
