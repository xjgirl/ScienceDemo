package com.wzxy.science.service.impl;

import com.wzxy.science.dao.IRoleRightDao;
import com.wzxy.science.entity.SysRoleRight;
import com.wzxy.science.service.IRoleRightService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional(rollbackFor = Exception.class)
@Service("roleRightService")
public class RoleRightServiceImpl implements IRoleRightService {
    @Resource
    private IRoleRightDao roleRightDao;

    @Override
    public void addRoleRight(SysRoleRight sysRoleRight) {
        roleRightDao.save(sysRoleRight);
    }

    @Override
    public void delete(String roleId) {
        roleRightDao.deleteByRoleId(roleId);
    }

    @Override
    public List<SysRoleRight> findByRole(String roleId) {
        return roleRightDao.findByRoleId(roleId);
    }
}
