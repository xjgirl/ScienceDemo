package com.wzxy.science.dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T> {
    /**
     *
     * @param entity
     * @return
     */
    public  T save(T entity);
    /**
     *
     * @param entity
     * @return
     */
    public  T merge(T entity);
    /**
     *
     * @param entity
     */
    public  void update(T entity);
    /**
     *
     * @param clazz
     * @param id
     * @return
     */
    public  T get(Class<T> clazz,Serializable id);
    /**
     *
     * @param clazz
     * @param id
     */
    public  void remove(Class <T> clazz,Serializable id);
    /**
     *
     * @param entity
     */
    public  void remove(T entity);
    /**
     *
     * @return
     */
    public  List<T> getAll(Class<T> clazz);
    /**
     *
     * @param queryString
     * @param params
     * @return
     */
    public  List<T> findByHql(String queryString, Object[] params);
    /**
     *
     * @param queryString
     * @param params
     * @param start
     * @param limit
     * @return
     */
    public List<T> findByHql(String queryString, Object[] params, int start, int limit);

    /**
     * Remove the given object from the Session cache
     * @param entity
     */
    public  void evict(T entity);
    /**
     *
     */
    public  void flush();
    /**
     *
     * @param queryString
     * @param values
     * @return
     */
    public  Long update(String queryString, Object[] values);

    /**
     *
     * @param hql
     * @return T
     */
    public T findByHql(String hql);
    public T get(Serializable id);

}
