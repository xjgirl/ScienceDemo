package com.wzxy.science.service.impl;

import com.wzxy.science.dao.IRoleDao;
import com.wzxy.science.entity.SysRole;
import com.wzxy.science.entity.SysRoleRight;
import com.wzxy.science.service.IRoleRightService;
import com.wzxy.science.service.IRoleService;
import com.wzxy.science.util.Result;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional(rollbackFor = Exception.class)
//注入服务
@Service("roleService")
public class RoleServiceImpl implements IRoleService {

    //自动注入
    @Resource
    private IRoleDao roleDao;

    @Resource
    private IRoleRightService roleRightService;


    @Override
    public Result<SysRole> find(SysRole sysRole, int page, int row) {
        return roleDao.find(sysRole, page, row);
    }

    @Override
    public void add(SysRole sysRole, String[] rightId) {
        for(int i = 0; i < rightId.length; i++){
            SysRoleRight sysRoleRight = new SysRoleRight();
            sysRoleRight.setRoleId(sysRole.getRoleId());
            sysRoleRight.setRightId(rightId[i]);
            roleRightService.addRoleRight(sysRoleRight);
        }
        roleDao.save(sysRole);
    }

    @Override
    public SysRole findById(String roleId) {
        return roleDao.get(SysRole.class, roleId);
    }

    @Override
    public void update(SysRole sysRole, String[] rightId) {
//根据角色编号删除角色权限
        roleRightService.delete(sysRole.getRoleId());
        //添加角色权限
        for(int i = 0; i < rightId.length; i++){
            SysRoleRight sysRoleRight = new SysRoleRight();
            sysRoleRight.setRoleId(sysRole.getRoleId());
            sysRoleRight.setRightId(rightId[i]);
            roleRightService.addRoleRight(sysRoleRight);
        }
        //更新角色信息
        roleDao.update(sysRole);
    }

    @Override
    public void delete(String roleId) {
        roleRightService.delete(roleId);
        roleDao.remove(findById(roleId));
    }

    @Override
    public String checkRoleName(String roleId) {
        SysRole sysRole = roleDao.get(SysRole.class, roleId);
        if(null != sysRole){
            return "no";
        }else{
            return "ok";
        }
    }

    @Override
    public List<SysRole> getRoleAll() {
        return roleDao.getAll(SysRole.class);
    }
}
