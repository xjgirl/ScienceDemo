package com.wzxy.science.dao;

import com.wzxy.science.entity.SysRight;
import com.wzxy.science.util.Result;

import java.util.List;

public interface IRightDao extends BaseDao<SysRight> {
    /**
     *
     * @param sysRight
     * @param page
     * @param row
     * @return
     */
    public Result<SysRight> find(SysRight sysRight, int page, int row);

    /**
     * 查询所有权限
     * @return
     */
    public List<SysRight> getAllRight();
}
