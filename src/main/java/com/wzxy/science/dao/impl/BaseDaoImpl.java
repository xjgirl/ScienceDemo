package com.wzxy.science.dao.impl;

import com.wzxy.science.dao.BaseDao;
import com.wzxy.science.util.Result;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.type.Type;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

@Repository("baseDao")
public class BaseDaoImpl<T> implements BaseDao<T> {
    protected final Log logger = LogFactory.getLog(getClass());

    HibernateTemplate hibernateTemplate;
    Class entityClass = null;

    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    @Resource
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Override
    public T save(T entity) {
        try {
            getHibernateTemplate().saveOrUpdate(entity);
        } catch (RuntimeException e) {
            logger.error("save failed", e);
            throw e;
        }
        return entity;
    }

    @Override
    public T merge(T entity) {
        getHibernateTemplate().merge(entity);
        return entity;
    }

    @Override
    public void update(T entity) {
        getHibernateTemplate().update(entity);

    }

    @Override
    public T get(Class<T> clazz, Serializable id) {
        return getHibernateTemplate().get(clazz, id);
    }

    @Override
    public void remove(Class<T> clazz, Serializable id) {
        getHibernateTemplate().delete(get(clazz, id));
    }

    @Override
    public void remove(T entity) {
        getHibernateTemplate().delete(entity);
    }

    @Override
    public List<T> getAll(final Class<T> clazz) {
        Object result = getHibernateTemplate().execute(
                new HibernateCallback<Object>() {
                    public Object doInHibernate(Session session)
                            throws HibernateException {
                        String hql = "from " + clazz.getName();
                        Query query = session.createQuery(hql);
                        return query.list();
                    }
                });
        return (List) result;
    }

    @Override
    public List<T> findByHql(String queryString, Object[] params) {
        return (List<T>) getHibernateTemplate().find(queryString, params);
    }

    @Override
    public List<T> findByHql(String queryString, final Object[] values, int start, int limit) {
        return (List) getHibernateTemplate().execute(
                new HibernateCallback<List>() {
                    public List doInHibernate(Session session)
                            throws HibernateException {
                        Query query = session.createQuery(queryString);
                        query.setFirstResult(start).setMaxResults(limit);
                        if (values != null) {
                            for (int i = 0; i < values.length; i++) {
                                query.setParameter(i, values[i]);
                            }
                        }
                        return query.list();
                    }
                });
    }

    @Override
    public void evict(T entity) {
        getHibernateTemplate().evict(entity);
    }

    @Override
    public void flush() {
        getHibernateTemplate().flush();
    }

    @Override
    public Long update(final String queryString, final Object[] values) {
        int c = getHibernateTemplate().executeWithNativeSession(
                new HibernateCallback<Integer>() {
                    public Integer doInHibernate(Session session)
                            throws HibernateException {
                        Query queryObject = session.createQuery(queryString);

                        if (values != null) {
                            for (int i = 0; i < values.length; i++) {
                                queryObject.setParameter(i, values[i]);
                            }
                        }
                        return queryObject.executeUpdate();
                    }
                });
        return new Long(c);
    }

    @Override
    public T findByHql(String hql) {
        return (T) getHibernateTemplate().execute(
                new HibernateCallback<T>() {
                    public T doInHibernate(Session session)
                            throws HibernateException {
                        Query query = session.createQuery(hql);

                        return (T) query.uniqueResult();
                    }
                });
    }

    @Override
    public T get(Serializable id) {
        return (T) getHibernateTemplate().get(entityClass, id);
    }
    public Result find(

            final String queryString, final Object[] values,
            final Type[] types, final int start, final int limit) {
        try{
            Result result = new Result(start, limit);

            if ( start != -1 && limit != -1) {
               // result.setTotal(getTotalItems(queryString, values).intValue());
            }

            HibernateTemplate ht = getHibernateTemplate();

            List data = ht.execute(new HibernateCallback<List>() {
                public List doInHibernate(Session session)
                        throws HibernateException {
                    Query queryObject = session.createQuery(queryString);

                    setParameters(queryObject, values, types);

                    if (start >= 0) {
                        queryObject.setFirstResult(start);
                    }

                    if (limit >= 0) {
                        //queryObject.setMaxResults(limit + 1);
                        queryObject.setMaxResults(limit);
                    }

                    return queryObject.list();
                }
            });

            result.setData(data);

            if (start == -1 && limit == -1) {
                result.setTotal(data.size());
            }

            return result;
        }catch (RuntimeException e) {
            throw e;
        }
    }

    /**
     * SQL
     *
     * @param queryObject
     * @param values
     * @param types
     */
    static void setParameters(Query queryObject, Object[] values, Type[] types) {
        if (values != null) {
            if (types != null) {
                for (int i = 0; i < values.length; i++) {
                    queryObject.setParameter(i, values[i], (org.hibernate.type.Type) types[i]);
                }
            } else {
                for (int i = 0; i < values.length; i++) {
                    queryObject.setParameter(i, values[i]);
                }
            }
        }
    }


    /**
     *
     * @param queryString
     * @param values
     * @param types
     * @return
     * @throws DataAccessException
     */
    protected int bulkUpdate(final String queryString, final Object[] values,
                             final Type[] types) throws DataAccessException {

        Integer updateCount = (Integer) getHibernateTemplate().execute(
                new HibernateCallback<Integer>() {
                    public Integer doInHibernate(Session session)
                            throws HibernateException {
                        Query queryObject = session.createQuery(queryString);
                        setParameters(queryObject, values, types);
                        return new Integer(queryObject.executeUpdate());
                    }
                });
        return updateCount.intValue();
    }
    /**
     *
     * @param sql
     * @param entityAlias
     * @param entityClass
     * @param values
     * @param types
     * @return
     */
    protected List findBySQL(final String sql, final String entityAlias,
                             final Class<T> entityClass, final Object[] values,
                             final Type[] types) {
        return findBySQL(sql, entityAlias, entityClass, values, types, -1, -1)
                .getData();
    }

    protected Result findBySQL(final String sql, final String entityAlias,
                               final Class<T> entityClass, final Object[] values,
                               final Type[] types, final int start, final int limit) {
        return findBySQL(sql, entityAlias, entityClass, values, types, start,
                limit, true);
    }

    @SuppressWarnings("rawtypes")
    protected Result findBySQL(final String sql, final String entityAlias,
                               final Class entityClass, final Object[] values, final Type[] types,
                               final int start, final int limit, boolean readOnly) {

        HibernateTemplate ht = getHibernateTemplate();

        Result result = new Result(start, limit);

        if (start != -1 && limit != -1) {

          //  Number count = getTotalItems(sql, values);
          //  result.setTotal(count.intValue());
        }

        List data = ht.execute(new HibernateCallback<List>() {
            public List doInHibernate(Session session)
                    throws HibernateException {
                SQLQuery query = session.createSQLQuery(sql);
                query.addEntity(entityAlias, entityClass);
                query.setParameters(values, types);

                if (start >= 0) {
                    query.setFirstResult(start);
                }

                if (limit >= 0) {
                    query.setMaxResults(limit + 1);
                }

                return query.list();
            }
        });

        result.setData(data);

        if (start == -1 && limit == -1) {
            result.setTotal(data.size());
        }

        return result;
    }

    /**
     *
     * @param queryString
     * @param values
     * @return
     */
//    public Long getTotalItems(String queryString, final Object[] values) {
//        int orderByIndex = queryString.toUpperCase().indexOf(" ORDER BY ");
//
//        if (orderByIndex != -1) {
//            queryString = queryString.substring(0, orderByIndex);
//        }
//
//        QueryTranslatorImpl queryTranslator = new QueryTranslatorImpl(
//                queryString, queryString, Collections.EMPTY_MAP,
//                (SessionFactoryImplementor) getHibernateTemplate().getSessionFactory());
//        queryTranslator.compile(Collections.EMPTY_MAP, false);
//        final String sql = "select count(*) from ("
//                + queryTranslator.getSQLString() + ") tmp_count_t";
//
//        Object reVal = getHibernateTemplate().execute(
//                new HibernateCallback<Object>() {
//                    public Object doInHibernate(Session session)
//                            throws HibernateException{
//                        SQLQuery query = session.createSQLQuery(sql);
//                        if (values != null) {
//                            for (int i = 0; i < values.length; i++) {
//                                query.setParameter(i, values[i]);
//                            }
//                        }
//                        return query.uniqueResult();
//                    }
//                });
//        return new Long(reVal.toString());
//    }

    /**
     * SQL查询(不联合实体)
     *
     *
     * @param queryString
     * @param values
     * @return
     */
    public List findBySQL(final String queryString,final Object[] values){
        return (List)getHibernateTemplate().execute(new HibernateCallback<List>() {
            @Override
            public List doInHibernate(Session session) throws HibernateException{
                SQLQuery sqlQuery = session.createSQLQuery(queryString);
                if (values != null) {
                    for (int i = 0; i < values.length; i++) {
                        sqlQuery.setParameter(i, values[i]);
                    }
                }
                return sqlQuery.list();
            }
        });
    }
    /**
     * SQL分页查询，sql的格式select <别名>.* from charge_record <别名> where 子句 order by 字句。
     * 例如"select cr.* from charge_record cr where 1=1 order by charge_year" ，
     * 其中的cr就是别名，参数alias就该应是"cr"。
     * @param sql
     * @param entityAlias 请对应查询语句中的<别名>
     * @param entityClass 结果集中游标的位置
     * @param size 每页显示的记录数
     * @return
     *
     */
    @SuppressWarnings("rawtypes")
    protected Result findBySQL(final String sql, final String entityAlias,final Class<T> entityClass, int page, int size) {
        final int start=(page-1)*size;
        final int limit =size;
        HibernateTemplate ht = getHibernateTemplate();
        Result result = new Result(start, limit);
        if (start > -1 && limit > -1) {
            Long count = getTotalItemsBySql(sql);
            result.setTotal(count.intValue());
        }
        List data = ht.executeWithNativeSession(new HibernateCallback<List>() {
            public List doInHibernate(Session session)
                    throws HibernateException {
                SQLQuery query = session.createSQLQuery(sql);
                if(entityClass!=null&&entityAlias!=null){
                    query.addEntity(entityAlias, entityClass);
                }
                if (start >= 0&&limit>0) {
                    query.setFirstResult(start);
                }
                if (limit >= 0) {
                    query.setMaxResults(limit);
                }
                return query.list();
            }
        });
        result.setData(data);
        if (start == -1 && limit == -1) {
            result.setTotal(data.size());
        }
        return result;
    }
    private Long getTotalItemsBySql(String sql) {
        // TODO Auto-generated method stub
        return null;
    }
}
