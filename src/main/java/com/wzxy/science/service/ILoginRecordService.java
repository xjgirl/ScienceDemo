package com.wzxy.science.service;

import com.wzxy.science.entity.SysLoginRecord;
import com.wzxy.science.util.Result;

public interface ILoginRecordService {
    /**
     * 查询所有用户登陆记录
     * @param page
     * @param row
     * @return
     *
     */
    public Result<SysLoginRecord> findAll(int page , int row, String logtype);

    /**
     * 根据用户登录id，查询用户信息
     * @param id
     * @return
     * @
     */
    public SysLoginRecord findById(int id);

    /**
     * 删除某条用户登录记录
     * @param id
     *
     */
    public void delete(int id);

    /**
     * 添加登录的用户
     * @param sysLoginRecord
     *
     */
    public void add(SysLoginRecord sysLoginRecord);

}
