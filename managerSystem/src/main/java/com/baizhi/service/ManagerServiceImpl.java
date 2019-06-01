package com.baizhi.service;

import com.baizhi.dao.ManagerDao;
import com.baizhi.entity.Manager;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerDao managerDao;
    @Override
    public PageInfo finfByPage(Integer page, Integer row) {
        if(page==null)page=1;
        if(row==null)row=3;
        PageHelper.startPage(page,row);
        List<Manager> all = managerDao.findAll();
        PageInfo<Manager> pageInfo = new PageInfo<>(all);
        return pageInfo;
    }

    @Override
    public Manager findById(String id) {
        return managerDao.findById(id);
    }

    @Override
    public void update(Manager manager) {
        managerDao.update(manager);
    }

    @Override
    public void insert(Manager manager) {
        managerDao.insert(manager);
    }

    @Override
    public void del(String id) {
        managerDao.del(id);
    }
}
