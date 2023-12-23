package com.universestay.project.inquiry.controller;

import com.universestay.project.inquiry.service.UserInquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/myPage/inquiry")
public class UserInquiryController {

    @Autowired
    UserInquiryService userInquiryService;

    @GetMapping()
    public String view(HttpSession session){
        return "inquiry/userInquiry";
    }


}
