//package com.universestay.project.user.controller;
//
//import com.universestay.project.common.SearchCondition;
//import com.universestay.project.user.service.UserInquiryService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import javax.servlet.http.HttpSession;
//
//@Controller
//@RequestMapping("/user/myPage/inquiry")
//public class UserInquiryController {
//
//    @Autowired
//    UserInquiryService userInquiryService;
//
//
//    @GetMapping("/list")
//    public String myInquiry(SearchCondition sc, Model model){
//        System.out.println("===GET  /user/myPage/inquiry/list===");
//        try {
//            userInquiryService.getInquiryPage(sc);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return "user/myPage/userInquiryList";
//    }
//
//    @GetMapping()
//    public String getInquiry(HttpSession session){
//        System.out.println("===GET /user/myPage/inquiry===");
//
//        return "user/myPage/userInquiry";
//    }
//
//    @PostMapping("/write")
//    public String submitInquiry(){
//        System.out.println("===POST  /user/myPage/inquiry/write===");
//
//        return "redirect: /user/myPage/inquiry/list";
//    }
//}
