package com.universestay.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("css")
public class CssTest {

    @GetMapping("test")
    public String cssTest(){
        return "cssTest";
    }
}
