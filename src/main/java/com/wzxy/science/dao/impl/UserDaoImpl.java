package com.wzxy.science.dao.impl;

import com.wzxy.science.dao.IUserDao;
import com.wzxy.science.entity.SysRoleRight;
import com.wzxy.science.entity.SysUser;
import com.wzxy.science.util.Result;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

//出现Exception异常回滚
@Transactional(rollbackFor = Exception.class)
//进行注入
@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<SysUser> implements IUserDao {

    /**
     * 根据条件分页查找
     * @param sysUser
     * @param page
     * @param size
     * @return
     */
    @Override
    public Result<SysUser> find(SysUser sysUser, int page, int size) {
        String queryString = "from SysUser";
        if(null != sysUser.getUserName()){
            queryString = queryString + " where user_name like '%"+sysUser.getUserName()+"%' or user_address like '%"+sysUser.getUserName()+"%'";
        }
        int start=(page-1)*size;
        int limit =size;
        return (Result<SysUser> )super.find(queryString, null, null, start, limit);
    }

    /**
     * 用户登录
     * @param loginNameValue
     * @param loginType
     * @return
     */
    @Override
    public List<SysUser> findByOtherId(String loginNameValue, int loginType) {
        //List<SysUser> listUser = null;
        String queryString = "from SysUser where 1=1 ";
        if(1 == loginType){
            queryString = queryString + " and userQq = '"+loginNameValue+"'";
        }
        if(2 == loginType){
           // queryString = queryString + " and userWeixin = '"+loginNameValue+"'";
        }
        if(3 == loginType){
           // queryString = queryString + " and userWeibo = '"+loginNameValue+"'";
        }
        return (List<SysUser>) this.getHibernateTemplate().find(queryString);
    }

    /**
     * 验证用户名是否重复
     * @param userId
     * @return
     */
    @Override
    public List<SysUser> checkUserId(String userId) {
        String hql = "from SysUser where userId = '"+userId+"'";
        return (List<SysUser>) this.getHibernateTemplate().find(hql);
    }

    /**
     * 验证用户名是否重复
     * @param userId
     * @return
     */
    @Override
    public List<SysUser> checkUserName(String userId) {
        String hql = "from SysUser where userName = '"+userId+"'";
        return (List<SysUser>) this.getHibernateTemplate().find(hql);
    }

    /**
     * 判断服务器是否存在该值（用户名是否重复，手机号码是否重复等）
     * @param property
     * @param value
     * @return
     */
    @Override
    public boolean isHadValue(String property, String value) {
        boolean isT = false;
        String hql = "from SysUser where "+property+" = '"+value+"'";
        List<SysUser> list = (List<SysUser>) this.getHibernateTemplate().find(hql);
        if(null != list && 0<list.size()){
            isT = true;
        }
        return isT;
    }

    /**
     * 根据property属性的值value获取对象
     * @param property
     * @param value
     * @return
     */
    @Override
    public SysUser findSysUserByProperty(String property, String value) {
        SysUser sysUser = null;
        String hql = "from SysUser where "+property+" = '"+value+"'";
        List<SysUser> list = (List<SysUser>) this.getHibernateTemplate().find(hql);
        if(null != list && 0<list.size()){
            sysUser = list.get(0);
        }
        return sysUser;
    }

    /**
     *
     * @param userName
     * @return
     */
    @Override
    public SysUser findSysUserByUserNameOrUserId(String userName) {
        SysUser sysUser = null;
        sysUser = this.findSysUserByProperty("userName", userName);
        if(null == sysUser){
            sysUser = this.findSysUserByProperty("userId", userName);
        }
        return sysUser;
    }

    /**
     *根据property属性的值value获取对象
     * @param userId
     * @return
     */
    @Override
    public SysUser fingByUserid(String userId) {
        SysUser sysUser = null;
        String hql = "from SysUser where userId = '"+userId+"'";
        List<SysUser> list = (List<SysUser>) this.getHibernateTemplate().find(hql);
        if(null != list && 0<list.size()){
            sysUser = list.get(0);
        }
        return sysUser;
    }

    /**
     *根据用户id查询用户的权限id
     * @param userId
     * @return
     */
    @Override
    public List<SysRoleRight> findUserPermissions(String userId) {
        String queryString="select new SysRoleRight(srr.rightId) " +
                "from SysUser su,SysUserRole sur,SysRole sr,SysRoleRight srr "+
                "where su.userId=sur.userId and sur.roleId=sr.roleId and sr.roleId=srr.roleId and su.userId='"+userId+"'";
        return (List<SysRoleRight>) getHibernateTemplate().find(queryString);
    }

    /**
     * 根据条件查找分页
     * @param sysUser
     * @param page
     * @param size
     * @return
     */
    @Override
    public Result<SysUser> findApplicant(SysUser sysUser, int page, int size) {
        String queryString = "from SysUser where studentType=0";
        if(null != sysUser.getUserName()){
            queryString = queryString + " and userName like '%"+sysUser.getUserName()+"%'";
        }
        int start=(page-1)*size;
        int limit =size;
        return (Result<SysUser> )super.find(queryString, null, null, start, limit);
    }

    @Override
    public void updatePersonal(String personalNumber, String password, String name, String realName, String mobilePhone, int sex, String mail, String address) {

    }
}
