package com.universestay.project.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserLogoutController {

    @GetMapping("/main")
    public String main() {
        return "main";
    }

    // 원장님 피드백 : USerLogoutService에서 처리없이 컨트롤러에서 처리하는 걸로 바꿈
    @RequestMapping("/userLogout")
    public String logout(HttpSession session, HttpServletResponse response) throws Exception {
        session.invalidate();
        Cookie user_profile_img_url_cookie = new Cookie("user_profile_img_url", null);
        user_profile_img_url_cookie.setPath("/");
        user_profile_img_url_cookie.setMaxAge(0);
        response.addCookie(user_profile_img_url_cookie);
        return "redirect:/";
    }
}
