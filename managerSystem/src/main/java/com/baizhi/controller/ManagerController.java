package com.baizhi.controller;

import com.baizhi.entity.Manager;
import com.baizhi.service.ManagerService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("manager")
public class ManagerController {
    @Autowired
    private ManagerService managerService;
    @RequestMapping("findByPage")
    public Map findByPage(Integer page,Integer row){
        Map map=new HashMap();
        PageInfo pageInfo = managerService.finfByPage(page, row);
        List list = pageInfo.getList();
        map.put("rows",list);
        map.put("records",pageInfo.getTotal());
        map.put("total",pageInfo.getPages());
        map.put("page",page);
        return map;
    }
    @RequestMapping("findById")
    public Manager findById(String id){
        return managerService.findById(id);
    }

    @RequestMapping("edit")
    public void edit(Manager manager){
        System.out.println("**************************");
        System.out.println(manager);
        String id = manager.getId();
        System.out.println(StringUtils.isEmpty(id)+"  "+manager.getSex());
        System.out.println("//////////////////////////////////////////////////");
        String sex=manager.getSex();
        if(StringUtils.isEmpty(id)){
            if(sex.equals("1")){
                manager.setSex("男");
            }else{
                manager.setSex("女");
            }
            manager.setId(UUID.randomUUID().toString());
            managerService.insert(manager);
        }else{
            if(sex.equals("1")){
                manager.setSex("男");
            }else{
                manager.setSex("女");
            }
            managerService.update(manager);
        }
    }

    @RequestMapping("del")
    public void delete(String id){
        managerService.del(id);
    }
}
