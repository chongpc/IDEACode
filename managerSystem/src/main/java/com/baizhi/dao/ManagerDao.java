package com.baizhi.dao;

import com.baizhi.entity.Manager;

import java.util.List;

public interface ManagerDao {
    List<Manager> findAll();
    Manager findById(String id);
    void update(Manager manager);
    void insert(Manager manager);
    void del(String id);
}
