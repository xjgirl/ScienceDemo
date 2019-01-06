package com.wzxy.science.dao;

import com.wzxy.science.entity.User;

public interface IUserDao {
    /**
     * 登录
     * @param user
     * @return
     */
    public boolean login(User user);
}
