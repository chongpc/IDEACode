package com.baizhi.service;

import com.baizhi.dao.ManagerDao;
import com.baizhi.entity.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerDao managerDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Manager findById(String username) {
        Manager manager = managerDao.findByUsername(username);
        return manager;
    }

    @Override
    public void addManager(Manager manager) {
        managerDao.addManager(manager);
    }
}
