package com.baizhi.service;

import com.baizhi.entity.Manager;
import com.github.pagehelper.PageInfo;

public interface ManagerService {
    PageInfo finfByPage(Integer page,Integer row);
    Manager findById(String id);
    void update(Manager manager);
    void insert(Manager manager);
    void del(String id);
}
