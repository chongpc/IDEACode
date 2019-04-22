package com.baizhi.service;

import com.baizhi.entity.Emps;

import java.util.List;

public interface EmpsService {
    List<Emps> findAllEmps();
    void deleteById(String id);
    Emps findById(String id);
    void update(Emps emps);
    void addEmp(Emps emps);
}
