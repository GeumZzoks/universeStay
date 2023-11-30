package com.universestay.project.user.controller;

import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.JoinService;
import com.universestay.project.user.service.MailSendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        try {
            if (joinService.registerUser(userDto) != 1) {
                throw new RuntimeException("등록 실패");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(0);
        }
        return ResponseEntity.ok(1);
    }

    // 닉네임 중복체크
    @PostMapping("/checkNickname")
    //@ResponseBody ajax 값을 바로jsp 로 보내기위해 사용
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

    // 이메일 인증
    @GetMapping("/mailCheck")
    public String mailCheck(String email) {
        try {
            return mailSendService.joinEmail(email);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/user/join";
        }
    }


}