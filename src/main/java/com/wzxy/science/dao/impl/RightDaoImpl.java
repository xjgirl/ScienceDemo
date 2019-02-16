package com.wzxy.science.dao.impl;

import com.wzxy.science.dao.IRightDao;
import com.wzxy.science.entity.SysRight;
import com.wzxy.science.util.Result;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("rightDao")
public class RightDaoImpl extends BaseDaoImpl<SysRight> implements IRightDao {
    /**
     *
     * @param sysRight
     * @param page
     * @param row
     * @return
     */
    @Override
    public Result<SysRight> find(SysRight sysRight, int page, int row) {
        String queryString="from SysRight";
        if(null != sysRight.getRightName()){
            queryString = queryString + " where rightName like '%"+sysRight.getRightName()+"%'";
        }
        int start=(page-1)*row;
        int limit =row;

        return (Result<SysRight>)super.find(queryString, null, null, start, limit);
    }

    /**
     *
     * @return
     */
    @Override
    public List<SysRight> getAllRight() {
        String queryString="from SysRight where 1=1 order by rightSortOrder asc";
        return (List<SysRight>) getHibernateTemplate().find(queryString);
    }
}
