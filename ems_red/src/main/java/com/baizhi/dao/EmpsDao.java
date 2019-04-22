package com.baizhi.dao;

import com.baizhi.entity.Emps;

import java.util.List;

public interface EmpsDao {
    List<Emps> findAllEmps();
    void deleteById(String id);
    Emps findById(String id);
    void update(Emps emps);
    void addEmp(Emps emps);
}
