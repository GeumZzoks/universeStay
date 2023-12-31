package com.universestay.project.admin.controller;

import com.universestay.project.admin.service.LoginAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

@Controller
@RequestMapping("/adminLogin")
public class LoginController {

    private final LoginAdminService loginAdminService;

    @Autowired
    public LoginController(LoginAdminService loginAdminService) {
        this.loginAdminService = loginAdminService;
    }

    @GetMapping("/loginForm")
    public String loginForm() {
        return "/admin/loginForm";
    }


    @PostMapping("/loginForm")
    public String loginForm(String userEmail, String password, HttpServletRequest request)
            throws Exception {

        if (!loginCheck(userEmail, password, request)) {
            // TODO: Validator 설정 - jsp로 message 반환
            String msg = URLEncoder.encode("아이디 또는 비밀번호가 일치하지 않습니다.", "utf-8");
            // TODO: Exception Handler 에러 페이지 반환
            return "redirect:/adminLogin/loginForm";
        }

        return "redirect:/admin/main/dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("admin_email");
        return "redirect:/adminLogin/loginForm";
    }


    public boolean loginCheck(String userEmail, String password, HttpServletRequest request)
            throws Exception {

        boolean result = loginAdminService.confirmUser(userEmail, password, request);

        return result;
    }

}
