package com.universestay.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class viewTest {

    @RequestMapping("/viewTest")
    public String viewTest() {
//        return "user/login";
        return "user/withdrawal";
    }
}
