package com.universestay.project.inquiry.controller;

import com.universestay.project.inquiry.service.AdminInquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/inquiry")
public class AdminInquiryController {

    @Autowired
    AdminInquiryService adminInquiryService;

    @GetMapping()
    public String view(HttpSession session){
        return "inquiry/adminInquiry";
    }



}
