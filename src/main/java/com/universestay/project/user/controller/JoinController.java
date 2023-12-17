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

    private int code;

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
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(0);
        }
        return ResponseEntity.ok(1);
    }

    // 닉네임 중복체크
    @PostMapping("/checkNickname")
    public ResponseEntity<String> checkId(@RequestParam("user_nickname") String user_nickname) {
        try {
            if (joinService.checkNickname(user_nickname) != 1) {
                return ResponseEntity.ok("N");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Y");
    }

    // 이메일 인증
    @GetMapping("/mailCheck")
    public ResponseEntity<String> mailCheck(String email) {
        try {
            System.out.println(joinService.checkEmail(email));
            if (joinService.checkEmail(email) != 1) {
                System.out.println("이메일 인증");
                code = Integer.parseInt(mailSendService.joinEmail(email));
                return ResponseEntity.ok("Y");
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("N");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("N");
        }
    }

    // 이메일 인증번호 확인
    @PostMapping("/checkMailCode")
    public ResponseEntity<String> checkMailCode(String inputCode) {
        try {

            if (code == Integer.parseInt(inputCode)) {
                return ResponseEntity.ok("Y");
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("N");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("N");
        }
    }
}