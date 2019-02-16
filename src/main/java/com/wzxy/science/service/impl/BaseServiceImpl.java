package com.wzxy.science.service.impl;

import com.wzxy.science.dao.BaseDao;
import com.wzxy.science.service.BaseService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;

/**
 *
 * @param <T>
 */

@Service("baseService")
@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor =RuntimeException.class)
public class BaseServiceImpl<T> implements BaseService<T> {
    protected final Log log = LogFactory.getLog(getClass());

    protected BaseDao<T> dao;

    public  void setDao(BaseDao<T> dao){
        this.dao=dao;
    }

    @Override
    public T save(T entity) {
        return dao.save(entity);
    }

    @Override
    public T merge(T entity) {
        return dao.merge(entity);
    }

    @Override
    public void update(T entity) {
        dao.update(entity);
    }

    @Override
    public T get(Class<T> clazz, Serializable id) {
        return dao.get(clazz, id);
    }

    @Override
    public void remove(Class<T> clazz, Serializable id) {
        dao.remove(clazz, id);
    }

    @Override
    public void remove(T entity) {
        dao.remove(entity);
    }
}
