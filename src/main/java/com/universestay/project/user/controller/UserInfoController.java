package com.universestay.project.user.controller;


import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.UserInfoService;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserInfoController {

    @Autowired
    UserInfoService userInfoService;

    @GetMapping("/info")
    public String getInfo(Model model, HttpSession session) throws Exception {
        String userEmail = (String) (session.getAttribute("user_email"));

        UserDto user = userInfoService.getUserInfo(userEmail);
        model.addAttribute("user", user);
        return "/user/myPage";
    }

}
