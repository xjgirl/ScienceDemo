package com.wzxy.science.service;

import com.wzxy.science.entity.SysRole;
import com.wzxy.science.util.Result;

import java.util.List;

public interface IRoleService {
    /**
     * 根据条件查找分页
     * @param sysRole 模型
     * @param page 第几页
     * @param row 长度
     * @return
     */
    public Result<SysRole> find(SysRole sysRole, int page, int row);
    /**
     * 保存权限
     * @param sysRole 权限
     */
    public void add(SysRole sysRole, String[] rightId);

    /**
     * 根据id查询一条数据
     * @param roleId
     * @return
     * @
     */
    public SysRole findById(String roleId);
    /**
     * 保存角色修改信息
     * @param sysRole 模型
     * @
     */
    public void update(SysRole sysRole, String[] rightId);
    /**
     * 删除角色信息
     * @param roleId 模型
     *
     */
    public void delete(String roleId);
    /**
     * 验证角色编号是否重复
     * @param roleId 角色编号
     */
    public String checkRoleName(String roleId);
    /**
     * 查询所有角色信息
     */
    public List<SysRole> getRoleAll();
}
