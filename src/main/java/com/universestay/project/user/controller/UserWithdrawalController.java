package com.universestay.project.user.controller;

import com.universestay.project.user.service.UserWithdrawalService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserWithdrawalController {

    @Autowired
    UserWithdrawalService userWithdrawalService;

    @RequestMapping("/withdrawal/{user_id}")
    public String withdrawal(@PathVariable String user_id, HttpSession session) {

        try {
            userWithdrawalService.withdrawal(user_id, session);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "HI";
    }
}
