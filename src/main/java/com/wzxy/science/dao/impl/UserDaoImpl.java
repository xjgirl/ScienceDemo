package com.wzxy.science.dao.impl;

import com.wzxy.science.dao.IUserDao;
import com.wzxy.science.entity.User;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.SessionFactoryUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import org.hibernate.Query;
import java.util.Iterator;

//出现Exception异常回滚
@Transactional(rollbackFor = Exception.class)
//进行注入
@Repository("userDao")
public class UserDaoImpl implements IUserDao {
    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;
    @Override
    public boolean login(User user) {
        Iterator<User> iterator;
        String hql = "from User u where u.userName=? and u.userPassword=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0, user.getUserName());
        query.setString(1, user.getUserPassword());
        iterator = query.iterate();

        if (iterator.hasNext()){
            return true;
        }else {
            return false;
        }
    }
}
