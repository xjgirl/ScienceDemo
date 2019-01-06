package com.wzxy.science.service.impl;

import com.wzxy.science.dao.IUserDao;
import com.wzxy.science.entity.User;
import com.wzxy.science.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

//注入服务
@Service("userService")
public class UserServiceImpl implements IUserService {
    //自动注入userdao
    @Resource
    private IUserDao userDao;
    @Override
    public boolean login(User user) {
        return this.userDao.login(user);
    }
}
