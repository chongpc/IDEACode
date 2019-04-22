package com.baizhi.controller;

import com.baizhi.entity.Manager;
import com.baizhi.service.ManagerService;
import com.baizhi.util.SecurityCode;
import com.baizhi.util.SecurityImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("manager")
public class ManagerController {
    @Autowired
    private ManagerService managerService;
    @RequestMapping("login")
    @ResponseBody
    public Map<String,Object> login(String username, String password, Model model){
        Map<String,Object> map=new HashMap<String,Object>();
        Manager manager = managerService.findById(username);
        if(manager!=null){
            if(manager.getPassword().equals(password)){
                model.addAttribute("manager",manager);
                map.put("success",true);
                return map;
            }else{
                map.put("message","password is wrong!!");
                return map;
            }
        }else{
            map.put("message","Username is wrong!");
            return map;
        }
    }

    //code
    @RequestMapping("code")
    public void code(HttpServletRequest request, HttpServletResponse response){
        String securityCode = SecurityCode.getSecurityCode();
        request.getSession().setAttribute("securityCode",securityCode);
        BufferedImage image = SecurityImage.createImage(securityCode);
        ServletOutputStream os = null;
        try {
            os=response.getOutputStream();
            ImageIO.write(image,"png",os);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                os.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    @RequestMapping("add")
    public String addManager(Manager manager,String number, HttpServletRequest request){
        System.out.println(manager);

        String securityCode = (String) request.getSession().getAttribute("securityCode");
        System.out.println(securityCode);
        if(securityCode.equals(number)){
            String s = UUID.randomUUID().toString();
            manager.setId(s);
            System.out.println(manager);
            managerService.addManager(manager);
            return "redirect:/login.jsp";
        }else{
            return "redirect:/regist.jsp";
        }
    }
}
