package com.wzxy.science.dao.impl;

import com.wzxy.science.dao.IUserRoleDao;
import com.wzxy.science.entity.SysUserRole;
import com.wzxy.science.util.Result;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

//出现Exception异常回滚
@Transactional(rollbackFor = Exception.class)
//进行注入
@Repository("userRoleDao")
public class UserRoleDaoImpl extends BaseDaoImpl<SysUserRole> implements IUserRoleDao {

    @Override
    public Result<SysUserRole> find(SysUserRole model, int page, int size) {
        String queryString="from SysUserRole where 1=1";
        int start=(page-1)*size;
        int limit =size;
        return (Result<SysUserRole>)super.find(queryString, null, null, start, limit);
    }

    @Override
    public void deleteByUserId(String userId) {
        String hql="delete from SysUserRole srr where srr.userId='"+userId+"'";
        this.getHibernateTemplate().bulkUpdate(hql);
    }

    @Override
    public List<SysUserRole> findByUserId(String userId) {
        String hql = "from SysUserRole where userId = '"+userId+"'";
        return (List<SysUserRole>)this.getHibernateTemplate().find(hql);
    }
}
