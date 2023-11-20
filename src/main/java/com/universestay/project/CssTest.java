package com.universestay.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("hello")
public class CssTest {

    @GetMapping("hi")
    public String cssTest(){
        return "hi";
    }
}
