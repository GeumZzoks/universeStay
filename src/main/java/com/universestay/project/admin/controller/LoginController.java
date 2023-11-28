package com.universestay.project.admin.controller;

import com.universestay.project.admin.service.LoginAdminService;
import java.net.URLEncoder;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String loginForm(String username, String password, HttpServletRequest request)
            throws Exception {

        if (!loginCheck(username, password, request)) {
            // TODO: message jsp 설정(Validator) or Exception Handler 에러 페이지 반환
            String msg = URLEncoder.encode("아이디 또는 비밀번호가 일치하지 않습니다.", "utf-8");

            return "redirect:/adminLogin/loginForm";
        }

        return "/admin/dashboard";
    }


    public boolean loginCheck(String username, String password, HttpServletRequest request)
            throws Exception {

        boolean result = loginAdminService.confirmUser(username, password, request);

        return result;
    }

}
