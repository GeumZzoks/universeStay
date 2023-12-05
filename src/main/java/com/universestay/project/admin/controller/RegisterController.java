package com.universestay.project.admin.controller;

import com.universestay.project.admin.dto.AdminDto;
import com.universestay.project.admin.service.RegisterService;
import com.universestay.project.common.exception.CommonException;
import com.universestay.project.user.service.MailSendService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
@RequestMapping("/admin/register")
public class RegisterController {

    private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());

    private final MailSendService mailSendService;
    private final RegisterService registerService;

    @Autowired
    public RegisterController(MailSendService mailSendService, RegisterService registerService) {
        this.mailSendService = mailSendService;
        this.registerService = registerService;
    }


    @GetMapping("/join")
    public String join() {
        return "admin/join";
    }

    /**
     * 관리자 회원가입
     *
     * @param adminDto
     * @return ResponseEntity
     * @throws RuntimeException
     */
    @PostMapping("/confirm")
    public ResponseEntity<Integer> confirm(@RequestBody AdminDto adminDto) {
        try {
            if (registerService.registerAdmin(adminDto) != 1) {
                System.out.println("try");
                throw new RuntimeException("등록 실패");
            }
        } catch (Exception e) {
            System.out.println("Exception e");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(0);
        }
        return ResponseEntity.ok(1);
    }

    /**
     * 관리자 닉네임 중복 체크
     *
     * @param admin_nickname
     * @return ResponseEntity
     * @throws RuntimeException
     */
    @PostMapping("/checkNickname")
    public ResponseEntity<String> checkNickname(
            @RequestParam("admin_nickname") String admin_nickname) {

        if (registerService.
                checkUniqueId(admin_nickname) != 1) {
            return ResponseEntity.ok("N");
        }

        LOGGER.info(
                String.valueOf(ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Y")));

        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Y");
    }


    /**
     * 관리자 메일 인증
     *
     * @param email
     * @return String
     * @throws CommonException
     */
    @GetMapping("/mailCheck")
    public String mailCheck(@RequestParam("email") String email) throws CommonException {
        try {
            return mailSendService.joinEmail(email);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/admin/register/join";
        }
    }
}
