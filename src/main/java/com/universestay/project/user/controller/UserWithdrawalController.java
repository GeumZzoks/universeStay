package com.universestay.project.user.controller;

import com.universestay.project.user.service.UserWithdrawalService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user/myPage")
public class UserWithdrawalController {

    @Autowired
    UserWithdrawalService userWithdrawalService;

    @GetMapping("/withdrawal")
    public String withdrawalForm() {
        return "user/myPage/withdrawal";
    }

    @PostMapping(value = "/withdrawal")
    public String withdrawalUser(@RequestParam String user_email, HttpSession session) {

        try {
            userWithdrawalService.withdrawal(user_email, session);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/main.jsp";
    }
}
