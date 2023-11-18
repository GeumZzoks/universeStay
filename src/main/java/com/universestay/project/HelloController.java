package com.universestay.project;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("TEST")
public class HelloController {
    @GetMapping("HI")
    public String Hi(){
        return "HI";
    }
}
