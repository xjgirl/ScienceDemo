package com.wzxy.science.service.impl;

import com.wzxy.science.dao.IRightDao;
import com.wzxy.science.entity.SysRight;
import com.wzxy.science.service.IRightService;
import com.wzxy.science.util.Result;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional(rollbackFor = Exception.class)
@Service("rightService")
public class RightServiceImpl implements IRightService {
    @Resource
    private IRightDao rightDao;

    @Override
    public Result<SysRight> find(SysRight sysRight, int page, int row) {
        return rightDao.find(sysRight, page, row);
    }

    @Override
    public void add(SysRight sysRight) {
        rightDao.save(sysRight);
    }

    @Override
    public SysRight findById(String rightId) {
        return rightDao.get(SysRight.class, rightId);
    }

    @Override
    public void update(SysRight sysRight) {
        rightDao.update(sysRight);
    }

    @Override
    public void delete(String id) {
        rightDao.remove(findById(id));
    }

    @Override
    public List<SysRight> getRightAll() {
        return rightDao.getAllRight();
    }

    @Override
    public String checkRightId(String rightId) {
        SysRight sysRight = rightDao.get(SysRight.class, rightId);
        if(null != sysRight){
            return "no";
        }else{
            return "ok";
        }
    }
}
