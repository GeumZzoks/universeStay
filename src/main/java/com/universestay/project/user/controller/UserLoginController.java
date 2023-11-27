package com.universestay.project.user.controller;

import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.UserLoginService;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
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
            HttpServletResponse response, HttpSession session,
            RedirectAttributes redirectAttributes) throws Exception {

        Map<String, String> error = new HashMap<>();

        userLoginService.setCookie(user_email, remember_id, response);
        userLoginService.isCredentialsPresent(error, user_email, user_pwd);

        if (!error.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", error);
            return "redirect:/loginForm";
        }

        // 로그인 처리
        // 서비스 호출 : 조회할 email, pwd, cookie를 서비스에게 넘겨줌.
        // 조회된 정보는 UserDto 타입에 담고, 받아온 파라미터의 정보와 일치 유무에 따라 다른 뷰를 보여줌
        UserDto userInfo = userLoginService.signin(user_email, user_pwd, session);

        // try-catch를 안해도 되나?
        if (userInfo != null) {
            return "HI";
        } else {
            error.put("id null or pwd invalid", "아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다.");
            redirectAttributes.addFlashAttribute("error", error);
            return "redirect:/loginForm";
        }
    }

}
