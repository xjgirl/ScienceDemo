package com.wzxy.science.service;

import com.wzxy.science.entity.SysRight;
import com.wzxy.science.util.Result;

import java.util.List;

public interface IRightService {
    /**
     * 根据条件查找分页
     * @param sysRight 模型
     * @param page 第几页
     * @param row 长度
     * @return
     *
     */
    public Result<SysRight> find(SysRight sysRight, int page, int row);
    /**
     * 添加权限
     * @param sysRight
     *
     */
    public void add(SysRight sysRight);
    /**
     * 根据id查询一条记录
     * @param rightId
     * @return
     *
     */
    public SysRight findById(String rightId);
    /**
     * 保存修改权限信息
     * @param sysRight
     *
     */
    public void update(SysRight sysRight);
    /**
     * 根据id删除一条记录
     * @param id
     *
     */
    public void delete(String id);
    /**
     * 查询所有权限
     * @return
     */
    public List<SysRight> getRightAll();
    /**
     * 验证权限编号是否重复
     * @param rightId
     * @return
     */
    public String checkRightId(String rightId);
}
