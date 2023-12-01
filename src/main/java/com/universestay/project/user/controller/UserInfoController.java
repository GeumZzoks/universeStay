package com.universestay.project.user.controller;


import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.UserInfoService;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@Controller
@RequestMapping("/user/myPage")
public class UserInfoController {

    @Autowired
    private UserInfoService userInfoService;


    //마이페이지 나의 정보 조회
    @GetMapping("/info")
    public String getInfo(Model model, HttpSession session) throws Exception {
        //로그인 상태일때 세션에서 이메일 값을 가져와서 String으로 변환
        String userEmail = (String) (session.getAttribute("user_email"));
        //user정보를 가져와서 model에 담아 화면으로 반환
        UserDto user = userInfoService.getUserInfo(userEmail);
        System.out.println(user.toString() + user.getUser_name());
        model.addAttribute("user", user);
        return "/user/myPage/userInfo";
    }

    //나의 정보 수정
    @PostMapping("/info/update")
    public String updateInfo(Model model,
            @RequestPart(value = "img", required = false) MultipartFile img,
            @RequestPart(value = "user", required = false) UserDto user,
            HttpSession session) throws Exception {

        System.out.println(img);
        System.out.println(user);

        String userEmail = (String) (session.getAttribute("user_email"));
        user.setUser_email(userEmail);
        userInfoService.updateUserInfo(img, user);
        return "redirect:/user/myPage/info";
    }
}
