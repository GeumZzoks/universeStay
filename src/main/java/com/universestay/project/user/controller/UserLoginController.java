package com.universestay.project.user.controller;

import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.UserLoginService;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserLoginController {

    @Autowired
    UserLoginService userLoginService;

    @RequestMapping("/loginForm")
    public String loginForm() {
        return "user/loginForm";
    }

    @PostMapping("/userLogin")
    public String login(String user_email, String user_pwd, String remember_id,
            HttpServletResponse response, HttpSession session) throws Exception {
        // 로그인 처리
        // 서비스 호출 : 조회할 email, pwd, cookie를 서비스에게 넘겨줌.
        // 조회된 정보는 UserDto 타입에 담고, 받아온 파라미터의 정보와 일치 유무에 따라 다른 뷰를 보여줌
        UserDto userInfo = userLoginService.signin(user_email, user_pwd, remember_id, response,
                session);

        // try-catch를 안해도 되나?
        if (userInfo != null) {
            return "HI";
        } else {
            return "user/loginForm";
        }
    }

}
