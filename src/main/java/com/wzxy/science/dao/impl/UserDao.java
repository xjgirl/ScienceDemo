package com.wzxy.science.dao.impl;

import com.wzxy.science.entity.SysRoleRight;
import com.wzxy.science.entity.SysUser;
import com.wzxy.science.util.Result;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("tUserDao")
public class UserDao extends BaseDaoImpl<SysUser> {
    /**
     * 部门查询功能
     *
     */

    @SuppressWarnings("unchecked")
    public Result<SysUser> find(SysUser sysUser, int page, int size){
        String queryString="from SysUser where userType=4 and studentType=1";

        if(null != sysUser.getUserId()){//根据部门编码查询
            queryString = queryString + " and userId like'%"+sysUser.getUserId()+"%'";
        }
        if(null != sysUser.getUserRealName()){//根据学生名字进行查询
           queryString = queryString + " and userRealName like '%"+sysUser.getUserRealName()+"%'";
        }
        if(null != sysUser.getUserTelephone()){//根据手机号码进行查询
             queryString = queryString + " and userTelephone like'%"+sysUser.getUserTelephone()+"%'";
        }
        int start=(page-1)*size;
        int limit =size;

        return (Result<SysUser>)super.find(queryString, null, null, start, limit);
    }
    /**
     * 升序查询所有部门
     *
     * @return
     */
//    public List<SysUser> getAllUser(){
//        String queryString="from SysUser where 1=1 order by rightSortOrder asc";
//        return (List<SysUser>) getHibernateTemplate().find(queryString);
//    }
    /**
     * 查询最大公司编号
     * @param
     *
     * @return
     */
    //userId设置为自增吗
    @SuppressWarnings("unchecked")
    public List<SysUser> findMaxUserId(){
        String hql = "select max(userId) from SysUser ";
        return (List<SysUser>) this.getHibernateTemplate().find(hql);
    }

    /**
     * 根据用户id查询用户的权限id
     * @param userId
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<SysRoleRight> findUserPermissions(String userId) {
        String queryString="select new SysRoleRight(srr.rightId) " +
                "from SysUser su,SysUserRole sur,SysRole sr,SysRoleRight srr "+
                "where su.userId=sur.userId and sur.roleId=sr.roleId and sr.roleId=srr.roleId and su.userId='"+userId+"'";
        return (List<SysRoleRight>) getHibernateTemplate().find(queryString);
    }

//    public void updatePersonal(String personalNumber,String password,String name,String realName,String mobilePhone,int sex,String mail,String address){
//        String queryString = "update TbPersonalData set mobilePhone= '"+mobilePhone+"' ,password= '"+password+"' ,realName='"+realName+"',name='"+name+"',email='"+mail+"',address='"+address+"',sex="+sex+"  where personalNumber='"+personalNumber+"'";
//        getHibernateTemplate().bulkUpdate(queryString);
//
//
//    }

    /**
     * 判断服务器是否存在该值（用户名是否重复，手机号码是否重复等）
     * @param property SysUser对象的属性
     * @param value 值
     * @return true -重复了，false-不重复
     */
    public boolean isHadValue(String property,String value){
        boolean isT = false;
        String hql = "from SysUser where "+property+" = '"+value+"'";
        List<SysUser> list = (List<SysUser>) this.getHibernateTemplate().find(hql);
        if(null != list && 0<list.size()){
            isT = true;
        }
        return isT;
    }

}
