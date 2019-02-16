package com.wzxy.science.service.impl;

import com.wzxy.science.dao.IUserRoleDao;
import com.wzxy.science.entity.SysUserRole;
import com.wzxy.science.service.IUserRoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional(rollbackFor = Exception.class)
//注入服务
@Service("userRoleService")
public class UserRoelServiceImpl implements IUserRoleService {

    //自动注入
    @Resource
    private IUserRoleDao userRoleDao;

    /**
     * 添加用户角色
     * @param sysUserRole
     */
    @Override
    public void addUserRole(SysUserRole sysUserRole) {
        userRoleDao.save(sysUserRole);
    }

    /**
     * 根据id删除用户角色
     * @param id
     */
    @Override
    public void deleteUserRole(String id) {
        userRoleDao.deleteByUserId(id);
    }

    /**
     * 根据用户编号查询出所有权限
     * @param userId
     * @return
     */
    @Override
    public List<SysUserRole> findByUserId(String userId) {
        return userRoleDao.findByUserId(userId);
    }
}
