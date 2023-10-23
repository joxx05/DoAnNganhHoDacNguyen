/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hodacnguyen.controllers;

import com.hodacnguyen.service.TagService;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author CaNoc
 */
@Controller
public class LoginController {
    @Autowired
    private TagService tagService;
    
    @GetMapping("/login")
    public String index(Model model) {
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        model.addAllAttributes(map);
        return "login";
    }
    @GetMapping("/code")
    public String getPass(Model model,HttpSession session) {
        Map<String,Object> map = new HashMap<>();
        map.put("tags", tagService.list(0, 8));
        model.addAllAttributes(map);
        return "code";
    }
    
}
