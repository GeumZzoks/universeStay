package com.universestay.project.user.controller;

import com.universestay.project.user.dto.UserRequestDto;
import com.universestay.project.user.service.JoinService;
import com.universestay.project.user.service.MailSendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class JoinController {

    @Autowired
    private MailSendService mailSendService;
    @Autowired
    private JoinService joinService;

    //    회원가입 페이지
    @GetMapping("/join")
    public String join() {
        return "user/join";
    }

    @PostMapping("/join")
    @ResponseBody
    public String join(@RequestBody UserRequestDto userRequestDto) {
        System.out.println("test");
        System.out.println(userRequestDto.getUser_address());

        int result = 0;
        try {
            result = joinService.registerUser(userRequestDto);

            String viewPage = null;
            if (result == 1) {
                viewPage = "redirect:/user/login";
                return viewPage;
            } else {
                System.out.println("회원가입 실패");
                viewPage = "redirect:/user/join";
                return viewPage;
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    //이메일 인증
    @GetMapping("/mailCheck")
    @ResponseBody
    public String mailCheck(String email) {
        try {
            return mailSendService.joinEmail(email);
        } catch (Exception e) {
            e.printStackTrace();
            return "에러 발생: " + e.getMessage();
        }
    }
}

