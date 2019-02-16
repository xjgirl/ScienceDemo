package com.wzxy.science.dao;

import com.wzxy.science.entity.SysLoginRecord;
import com.wzxy.science.util.Result;

import java.util.List;

public interface ILoginRecordDao extends BaseDao<SysLoginRecord> {
    /**
     *
     * @param persistentInstance
     */
    public void delete(SysLoginRecord persistentInstance);

    /**
     *
     * @param id
     * @return
     */
    public SysLoginRecord findById(java.lang.String id);

    /**
     *
     * @param instance
     * @return
     */
    public List findByExample(SysLoginRecord instance);

    /**
     *
     * @param propertyName
     * @param value
     * @return
     */
    public List findByProperty(String propertyName, Object value);

    /**
     *
     * @return
     */
    public List findAll();

    /**
     *
     * @param detachedInstance
     * @return
     */
    public SysLoginRecord merge(SysLoginRecord detachedInstance);

    /**
     *
     * @param instance
     */
    public void attachDirty(SysLoginRecord instance);

    /**
     *
     * @param instance
     */
    public void attachClean(SysLoginRecord instance);

    /**
     *
     * @param page
     * @param size
     * @param logtype
     * @return
     */
    public Result<SysLoginRecord> find(int page, int size, String logtype);
}
