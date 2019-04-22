package com.baizhi.controller;

import com.baizhi.entity.Emps;
import com.baizhi.service.EmpsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("emps")
public class EmpsController {
    @Autowired
    private EmpsService empsService;
    @RequestMapping("findAllEmps")
    public String findAllEmps(Model model){
        List<Emps> emps = empsService.findAllEmps();
        model.addAttribute("emps",emps);
        return "emplist";
    }
    @RequestMapping("deleteById")
    public String deleteById(String id){
        empsService.deleteById(id);
        return "redirect:/emps/findAllEmps";
    }
    @RequestMapping("findById")
    public String findById(String id,Model model){
        Emps emps = empsService.findById(id);
        model.addAttribute("emps",emps);
        return "updateEmp";
    }
    @RequestMapping("update")
    public String update(Emps emps){
        empsService.update(emps);
        return "redirect:/emps/findAllEmps";
    }
    @RequestMapping("addEmp")
    public String addEmp(Emps emps){
        System.out.println(emps);
        String s = UUID.randomUUID().toString();
        emps.setId(s);
        empsService.addEmp(emps);
        return "redirect:/emps/findAllEmps";
    }
}
