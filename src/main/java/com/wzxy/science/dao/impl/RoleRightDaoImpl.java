package com.wzxy.science.dao.impl;

import com.wzxy.science.dao.IRoleRightDao;
import com.wzxy.science.entity.SysRoleRight;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("roleRightDao")
public class RoleRightDaoImpl extends BaseDaoImpl<SysRoleRight> implements IRoleRightDao {
    /**
     *
     * @param roleId
     */
    @Override
    public void deleteByRoleId(String roleId) {
        String hql="delete from SysRoleRight srr where srr.roleId='"+roleId+"'";
        this.getHibernateTemplate().bulkUpdate(hql);
    }

    /**
     *
     * @param roleId
     * @return
     */
    @Override
    public List<SysRoleRight> findByRoleId(String roleId) {
        String hql = "from SysRoleRight where roleId='"+roleId+"'";
        return (List<SysRoleRight>)this.getHibernateTemplate().find(hql);

    }
}
