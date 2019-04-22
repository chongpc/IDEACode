package com.baizhi.service;

import com.baizhi.dao.EmpsDao;
import com.baizhi.entity.Emps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class EmpsServiceImpl implements EmpsService {
    @Autowired
    private EmpsDao empsDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Emps> findAllEmps() {
        List<Emps> emps = empsDao.findAllEmps();
        return emps;
    }

    @Override
    public void deleteById(String id) {
        empsDao.deleteById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Emps findById(String id) {
        Emps emps = empsDao.findById(id);
        return emps;
    }

    @Override
    public void update(Emps emps) {
        empsDao.update(emps);
    }

    @Override
    public void addEmp(Emps emps) {
        empsDao.addEmp(emps);
    }
}
