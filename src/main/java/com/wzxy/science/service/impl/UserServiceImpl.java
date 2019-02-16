package com.wzxy.science.service.impl;

import com.wzxy.science.context.SystemContext;
import com.wzxy.science.dao.IUserDao;
import com.wzxy.science.entity.SysRoleRight;
import com.wzxy.science.entity.SysUser;
import com.wzxy.science.entity.SysUserRole;
import com.wzxy.science.service.IUserRoleService;
import com.wzxy.science.service.IUserService;
import com.wzxy.science.util.Result;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Transactional(rollbackFor = Exception.class)
//注入服务
@Service("userService")
public class UserServiceImpl implements IUserService {
    //自动注入userdao
    @Resource
    private IUserDao userDao;

    @Resource
    private IUserRoleService userRoleService;

    @Override
    public SysUser findByUserId(String userid) {
        return userDao.findSysUserByProperty("userId", userid);
    }

    @Override
    public int updateUserName(String userId, String userName) {
        int numT = 0;
        SysUser sysUser = userDao.findSysUserByProperty("userId", userId);//
        if(null != sysUser){
            sysUser.setUserName(userName);
            userDao.update(sysUser);
            numT = 1;
        }
        return numT;
    }

    @Override
    public int updateUserPassWd(String userId, String userPassword) {
        int numT = 0;
        SysUser sysUser = userDao.findSysUserByProperty("userId", userId);//
        if(null != sysUser){
            sysUser.setUserPassword(SystemContext.passwdEncryption(userPassword));
            userDao.update(sysUser);
            numT = 1;
        }
        return numT;
    }

    @Override
    public boolean isLogin(SysUser sysUser) {
        boolean isL = false;//初始化临时变量
        SysUser sysUserTem = null;
        try {
            sysUserTem = userDao.findSysUserByProperty("userName", sysUser.getUserName());
            //System.out.println("login"+sysUser.getUserName());
            if(null == sysUserTem){//用户名为空，再读用户编号
                sysUserTem = userDao.findSysUserByProperty("userId", sysUser.getUserName());
            }
            if(null != sysUserTem){
                //System.out.println("sysUserTem.getUserPassword="+sysUserTem.getUserPassword());
                if(SystemContext.passwdDecryption(sysUser.getUserPassword(),sysUserTem.getUserPassword())){
                    isL =true;
                }
            }
        } catch (Exception e) {

        }
        //isL = true;//测试

        return isL;
    }

    @Override
    public Result<SysUser> find(SysUser sysUser, int page, int row) {
        return userDao.find(sysUser, page, row);
    }

    @Override
    public void add(SysUser sysUser) {
        sysUser.setUserPassword(SystemContext.passwdEncryption(sysUser.getUserPassword()));
        userDao.save(sysUser);
    }

    @Override
    public void add(SysUser sysUser, String[] roleIds) {

            for(int i = 0; i < roleIds.length; i++){
                SysUserRole sysUserRole = new SysUserRole();
                sysUserRole.setUserId(sysUser.getUserId());
                sysUserRole.setRoleId(roleIds[i]);
                userRoleService.addUserRole(sysUserRole);
            }

        add(sysUser);

    }

    @Override
    public SysUser findById(int id) {
        return userDao.get(SysUser.class,id);
    }

    @Override
    public void update(SysUser sysUser, String[] roleIds, String oldPassword) {
//先根据用户编号删除用户角色
        userRoleService.deleteUserRole(sysUser.getUserId());
        //System.out.println("roleIds2===="+roleIds);
        if(null != roleIds){
            //再循环添加用户角色
            for(int i = 0; i < roleIds.length; i++){
                SysUserRole sysUserRole = new SysUserRole();
                sysUserRole.setUserId(sysUser.getUserId());
                sysUserRole.setRoleId(roleIds[i]);
                userRoleService.addUserRole(sysUserRole);
            }
        }

        if(sysUser.getUserPassword().equals("")){     //如果用户修改的密码为空，则是用户不修改密码，不用加密直接保存到数据库
            sysUser.setUserPassword(oldPassword);
        }else{
            //否则为已经修改了密码需要加密
            sysUser.setUserPassword(SystemContext.passwdEncryption(sysUser.getUserPassword()));
        }
        //更新用户信息

        userDao.update(sysUser);
    }

    @Override
    public void updateUserMessage(SysUser sysUser, String oldPassword) {
        if(sysUser.getUserPassword().equals("")){     //如果用户修改的密码为空，则是用户不修改密码，不用加密直接保存到数据库
            sysUser.setUserPassword(oldPassword);
        }else{
            //否则为已经修改了密码需要加密
            sysUser.setUserPassword(SystemContext.passwdEncryption(sysUser.getUserPassword()));
        }
        //更新用户信息
        userDao.update(sysUser);
    }

    @Override
    public void delete(int id, String userId) {
        userRoleService.deleteUserRole(userId);
        SysUser sysUser = findById(id);
        //System.out.println("用户管理 删除"+sysUser.getUserType());
		/*if(sysUser.getUserType() == 2){
			TbPersonalData tbPersonalData = tbPersonalDataService.findByPersonalNameWeb(sysUser.getUserId());
			tbPersonalDataDAO.remove(tbPersonalData);
		}*/
        userDao.remove(sysUser);
    }

    @Override
    public boolean checkUserId(String userId) {
        boolean result = false;
        List<SysUser> sysUser = userDao.checkUserId(userId);
        if(null != sysUser && sysUser.size()>0){
            result = true;
        }
        return result;
    }

    @Override
    public boolean checkUserName(String userId) {
        boolean result = false;
        List<SysUser> sysUser = userDao.checkUserName(userId);
        if(null != sysUser && sysUser.size()>0){
            result = true;
        }
        return result;
    }

    @Override
    public boolean checkPasswd(String rawPassword, String password) {
        return SystemContext.passwdDecryption(rawPassword, password);
    }

    @Override
    public SysUser findByName(String userName) {
        return userDao.findSysUserByUserNameOrUserId(userName);
    }

    @Override
    public List<String> findUserPermissions(String userId) {
        List<String> strList=new ArrayList<String>();
        List<SysRoleRight> list=userDao.findUserPermissions(userId);
        for(int i=0;i<list.size();i++){
            strList.add(list.get(i).getRightId());
        }
        return strList;
    }

    @Override
    public SysUser findByUserName(String userName) {
        return userDao.findSysUserByUserNameOrUserId(userName);
    }

    @Override
    public Result<SysUser> findApplicant(SysUser sysUser, int page, int row) {
        return userDao.findApplicant(sysUser, page, row);
    }

    @Override
    public void update(SysUser sysUser) {
        userDao.update(sysUser);
    }
}
