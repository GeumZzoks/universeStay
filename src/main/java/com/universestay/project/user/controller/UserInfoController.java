package com.universestay.project.user.controller;


import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.ProfileImgService;
import com.universestay.project.user.service.UserInfoService;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@Controller
@RequestMapping("/user/myPage")
public class UserInfoController {

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private ProfileImgService profileImgService;

    //마이페이지 나의 정보 조회
    @GetMapping("/info")
    public String getInfo(Model model, HttpSession session) throws Exception {
        //로그인 상태일때 세션에서 이메일 값을 가져와서 String으로 변환
        String userEmail = (String) (session.getAttribute("user_email"));
        //user정보를 가져와서 model에 담아 화면으로 반환
        UserDto user = userInfoService.getUserInfo(userEmail);
        String profileImgUrl = profileImgService.getProfileImgUrl(user.getUser_id());
        model.addAttribute("user", user);
        model.addAttribute("profileImgUrl", profileImgUrl);
        return "/user/myPage/userInfo";
    }

    //나의 정보 수정
    @PostMapping("/info/update")
    public ResponseEntity<String> updateInfo(
            @RequestPart(value = "img", required = false) MultipartFile img,
            @RequestPart(value = "user", required = false) UserDto user,
            HttpSession session) throws Exception {
        try {
            userInfoService.updateUserInfo(img != null ? img : null, user);
            return ResponseEntity.ok("Success");
        } catch (DuplicateKeyException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("DuplicateKeyError");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("ServerError");
        }
    }

    @PostMapping("/info/checkNickname")
    public ResponseEntity<String> checkNickname(@RequestParam("user_nickname") String user_nickname,
            HttpSession httpSession)
            throws Exception {
        String user_email = (String) httpSession.getAttribute("user_email");

        if (userInfoService.checkNickname(user_email, user_nickname) == "N") {
            return ResponseEntity.ok("Y");
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("N");
    }

    @PostMapping("/info/changePwd")
    public ResponseEntity<String> changePwd(@RequestParam("check_pwd") String check_pwd,
            @RequestParam("new_pwd") String new_pwd, @RequestParam("new_pwd2") String new_pwd2,
            HttpSession httpSession)
            throws Exception {

        String check = userInfoService.changePwd(check_pwd, new_pwd, new_pwd2, httpSession);

        if (check.equals("Correct")) {
            return ResponseEntity.ok("Correct");
        } else if (check.equals("Incorrect_with_DB")) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Incorrect_with_DB");
        } else if (check.equals("Incorrect_with_pwd_pwd2")) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Incorrect_with_pwd_pwd2");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Server_error");
        }
    }
}
