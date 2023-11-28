package com.universestay.project.user.controller;

import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.JoinService;
import com.universestay.project.user.service.MailSendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class JoinController {

    @Autowired
    private MailSendService mailSendService;
    @Autowired
    private JoinService joinService;

    // 회원가입 페이지
    @GetMapping("/join")
    public String join() {
        return "user/join";
    }

    @PostMapping("/join")
    public ResponseEntity<Integer> join(@RequestBody UserDto userDto) {

        int result = 0;
        try {
            result = joinService.registerUser(userDto);
            System.out.println("result = " + result);

            if (result == 1) {
                System.out.println("result2 = " + result);
                return ResponseEntity.ok(result);
            } else {
                return ResponseEntity.ok(result);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // 이메일 인증
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

    // 닉네임 중복체크
    @PostMapping("/checkNickname")
    public ResponseEntity<String> checkId(@RequestParam("user_nickname") String user_nickname) {
        System.out.println("user_nickname = " + user_nickname);
        String result = "N";

        int flag = 0;
        try {
            flag = joinService.checkNickname(user_nickname);
            System.out.println("flag = " + flag);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if (flag == 1) {
            result = "Y";
        }
        return ResponseEntity.ok(result);
    }
}

