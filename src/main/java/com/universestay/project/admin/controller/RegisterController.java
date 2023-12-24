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
import org.springframework.web.bind.annotation.ResponseBody;

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
    @ResponseBody
    public ResponseEntity confirm(@RequestBody AdminDto adminDto) {

        if (!(adminDto.getAdmin_pwd().equals(adminDto.getAdmin_pwd2()))) {
            return new ResponseEntity("비밀번호가 맞지 않습니다.", HttpStatus.BAD_REQUEST);
        }

        if (registerService.registerAdmin(adminDto) != 1) {
            return new ResponseEntity("", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(HttpStatus.OK);
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
    @PostMapping("/mailCheck")
    @ResponseBody
    public ResponseEntity mailCheck(@RequestParam("email") String email) throws CommonException {
        try {
            mailSendService.joinEmail(email);
            return new ResponseEntity(HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
