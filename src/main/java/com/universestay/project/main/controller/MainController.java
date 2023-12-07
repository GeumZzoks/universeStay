package com.universestay.project.main.controller;

import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.ProfileImgService;
import com.universestay.project.user.service.UserInfoService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @Autowired
    UserInfoService userInfoService;

    @Autowired
    ProfileImgService profileImgService;

    @GetMapping("/")
    public String main(HttpSession session, Model model) throws Exception {
        String userEmail = (String) (session.getAttribute("user_email"));
        if (userEmail == null) {
            return "main/main";
        }
        UserDto user = userInfoService.getUserInfo(userEmail);
        String profileImgUrl = profileImgService.getProfileImgUrl(user.getUser_id());
        String isHost = user.getUser_is_host();

        model.addAttribute("user", user);
        model.addAttribute("profileImgUrl", profileImgUrl);
        model.addAttribute("isHost", isHost);
        return "main/main";
    }
}
