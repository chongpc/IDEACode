package com.baizhi.dao;

import com.baizhi.entity.Manager;

public interface ManagerDao {
    Manager findByUsername(String username);
    void addManager(Manager manager);
}
