package com.universestay.project.user.controller;

import com.universestay.project.user.service.MailSendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class JoinController {

    @Autowired
    private MailSendService mailSendService;

    //이메일 인증
    @GetMapping("/mailCheck")
    @ResponseBody
    public String mailCheck(String email) {
        try {
            return mailSendService.joinEmail(email);
        } catch (Exception e) {
            e.printStackTrace();
            return "에러 발생: " + e.getMessage();
        }
    }
}

