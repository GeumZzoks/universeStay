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

@Slf4j
@Controller
@RequestMapping("/user/myPage")
public class UserInfoController {

    @Autowired
    UserInfoService userInfoService;

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
    public String updateInfo(Model model, UserDto user, HttpSession session) throws Exception {
        //로그인 상태일때 세션에서 이메일 값을 가져와서 String으로 변환
        String userEmail = (String) (session.getAttribute("user_email"));
        //user update때  Where user_email = #{user_email} 조건절이 있기 때문에 세션에서 이메일 값을 가져와 user에 세팅해준다.
        user.setUser_email(userEmail);
        userInfoService.updateUserInfo(user);
        return "redirect:/user/myPage";
    }
}
