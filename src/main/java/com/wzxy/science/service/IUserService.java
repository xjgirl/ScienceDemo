package com.wzxy.science.service;

import com.wzxy.science.entity.SysUser;
import com.wzxy.science.util.Result;

import java.util.List;

public interface IUserService {
    /**
     * 根据用户编号查询用户对象
     * @param userid 用户编号
     * @return 用户对象
     */
    public SysUser findByUserId(String userid);

    /**
     * 修改用户昵称
     * @param userId 用户编号
     * @param userName 用户昵称
     * @return 1-成功；0-出错
     */
    public int updateUserName(String userId,String userName);

    /**
     * 修改用户密码
     * @param userId 用户编号
     * @param userPassword  用户密码
     * @return 1-成功；0-出错
     */
    public int updateUserPassWd(String userId,String userPassword);

    /**
     * 用户登录
     * @param sysUser 用户对象
     * @return true -允许登录；false -不允许登录
     */
    public boolean isLogin(SysUser sysUser);

    /**
     * 根据条件查找分页
     * @param sysUser 模型
     * @param page 第几页
     * @param row 长度
     *
     */
    public Result<SysUser> find(SysUser sysUser, int page, int row);

    /**
     * 添加用户--所有的保存都要调用该方法，因为有加密
     * @param sysUser
     *
     */
    public void add(SysUser sysUser);

    /**
     * 添加用户
     * @param sysUser
     *
     */
    public void add(SysUser sysUser, String[] roleIds);

    /**
     * 根据Id查询单条记录
     * @param id
     * @return
     *
     */
    public SysUser findById(int id);

    /**
     * 修改用户信息
     * @param sysUser
     *
     */
    public void update(SysUser sysUser, String[] roleIds,String oldPassword);

    /**
     * 保存用户个人修改的信息
     * @param sysUser
     * @param oldPassword
     *
     */
    public void updateUserMessage(SysUser sysUser, String oldPassword);

    /**
     * 删除用户
     * @param userId 模型
     *
     */
    public void delete(int id,String userId);

    /**
     * 检验用户编号是否存在
     * @param userId
     * @return
     *
     */
    public boolean checkUserId(String userId);

    /**
     * 检验用户名是否存在
     * @param userId
     * @return
     *
     */
    public boolean checkUserName(String userId);

    /**
     * 校验用户密码
     * @param rawPassword 数据库保存的加密的密码
     * @param password 明文密码（需要匹配的用户输入的那份）
     * @return
     *
     */
    public boolean checkPasswd(String rawPassword, String password);

    /**
     * 根据用户名称查询用户信息
     * @param userName 用户名称
     * @return
     */
    public SysUser findByName(String userName);

    /**
     * 根据用户id查找用户权限id
     * @param userId
     * @return
     *
     */
    public List<String> findUserPermissions(String userId);

    /**
     * 根据userId查询对象
     */
    public SysUser findByUserName(String userName);

    /**
     * 根据条件查找分页
     * @param sysUser 模型
     * @param page 第几页
     * @param row 长度
     * @return
     *
     */
    public Result<SysUser> findApplicant(SysUser sysUser,int page, int row);

    /**
     * 修改用户信息
     * @param sysUser
     *
     */
    public void update(SysUser sysUser);
}
