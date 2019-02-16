package com.wzxy.science.dao;


import com.wzxy.science.entity.SysRoleRight;
import com.wzxy.science.entity.SysUser;
import com.wzxy.science.util.Result;

import java.util.List;

public interface IUserDao extends BaseDao<SysUser> {
    /**
     *
     * @param sysUser
     * @param page
     * @param size
     * @return
     */
    public Result<SysUser> find(SysUser sysUser, int page, int size);

    /**
     *
     * @param loginNameValue
     * @param loginType
     * @return
     */
    public List<SysUser> findByOtherId(String loginNameValue, int loginType);

    /**
     *
     * @param userId
     * @return
     */
    public List<SysUser> checkUserId(String userId);

    /**
     *
     * @param userId
     * @return
     */
    public List<SysUser> checkUserName(String userId);

    /**
     *
     * @param property
     * @param value
     * @return
     */
    public boolean isHadValue(String property,String value);

    /**
     *
     * @param property
     * @param value
     * @return
     */
    public SysUser findSysUserByProperty(String property,String value);

    /**
     *
     * @param userName
     * @return
     */
    public SysUser findSysUserByUserNameOrUserId(String userName);

    /**
     *
     * @param userId
     * @return
     */
    public SysUser fingByUserid(String userId);

    /**
     *
     * @param userId
     * @return
     */
    public List<SysRoleRight> findUserPermissions(String userId);

    /**
     *
     * @param sysUser
     * @param page
     * @param size
     * @return
     */
    public Result<SysUser> findApplicant(SysUser sysUser, int page, int size);

    /**
     *
     * @param personalNumber
     * @param password
     * @param name
     * @param realName
     * @param mobilePhone
     * @param sex
     * @param mail
     * @param address
     */
    public void updatePersonal(String personalNumber,String password,String name,String realName,String mobilePhone,int sex,String mail,String address);

}
