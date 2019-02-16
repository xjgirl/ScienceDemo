package com.wzxy.science.dao.impl;

import com.wzxy.science.dao.IRoleDao;
import com.wzxy.science.entity.SysRight;
import com.wzxy.science.entity.SysRole;
import com.wzxy.science.util.Result;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

//出现Exception异常回滚
@Transactional(rollbackFor = Exception.class)
//进行注入
@Repository("roleDao")
public class RoleDaoImpl extends BaseDaoImpl<SysRole> implements IRoleDao {

    @Override
    public Result<SysRole> find(SysRole model, int page, int size) {
        String queryString="from SysRole where 1=1";
        if(null != model.getRoleName()){
            queryString = queryString + " and role_name like '%"+model.getRoleName()+"%'";
        }
        int start=(page-1)*size;
        int limit =size;
        return (Result<SysRole>)super.find(queryString, null, null, start, limit);
    }

    @Override
    public Result<SysRight> findRightAll(SysRight sysRight) {
        String queryString = "from SysRight where 1=1";
        return (Result<SysRight>)super.find(queryString, null, null, 0, 0);
    }
}
