package com.baizhi.service;

import com.baizhi.entity.Manager;

public interface ManagerService {
    Manager findById(String username);
    void addManager(Manager manager);
}
