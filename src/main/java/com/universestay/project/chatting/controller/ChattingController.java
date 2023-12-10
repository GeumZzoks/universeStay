package com.universestay.project.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chatting")
public class ChattingController {

    @GetMapping("/contact_host")
    public String contact_host() {
        return "/chatting/contact_host";
    }


}
