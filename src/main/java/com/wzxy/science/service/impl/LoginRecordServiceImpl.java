package com.wzxy.science.service.impl;

import com.wzxy.science.dao.ILoginRecordDao;
import com.wzxy.science.entity.SysLoginRecord;
import com.wzxy.science.service.ILoginRecordService;
import com.wzxy.science.util.Result;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Transactional(rollbackFor = Exception.class)
//注入服务
@Service("loginRecordService")
public class LoginRecordServiceImpl implements ILoginRecordService {
    //自动注入loginRecordDao
    @Resource
    private ILoginRecordDao loginRecordDao;


    @Override
    public Result<SysLoginRecord> findAll(int page, int row, String logtype) {
        return loginRecordDao.find(page, row, logtype);
    }

    @Override
    public SysLoginRecord findById(int id) {
        return loginRecordDao.get(SysLoginRecord.class, id);
    }

    @Override
    public void delete(int id) {
        loginRecordDao.remove(findById(id));
    }

    @Override
    public void add(SysLoginRecord sysLoginRecord) {
        loginRecordDao.save(sysLoginRecord);
    }
}
