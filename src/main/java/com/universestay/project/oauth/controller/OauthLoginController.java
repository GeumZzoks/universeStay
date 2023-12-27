package com.universestay.project.oauth.controller;

import com.universestay.project.oauth.dto.google.GoogleInfResponseDto;
import com.universestay.project.oauth.dto.kakao.KakaoDTO;
import com.universestay.project.oauth.service.GoogleLoginService;
import com.universestay.project.oauth.service.KakaoLoginService;
import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.UserLoginService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/oauth2")
@RequiredArgsConstructor
@Slf4j
@PropertySource("classpath:config/oauth.properties")
public class OauthLoginController {

    @Value("${GOOGLE_CLIENT_ID}")
    private String googleClientId;
    @Value("${GOOGLE_REDIRECT_URL}")
    private String GOOGLE_REDIRECT_URL;
    @Value("${KAKAO_CLIENT_ID}")
    private String KAKAO_CLIENT_ID;
    @Value("${KAKAO_REDIRECT_URL}")
    private String KAKAO_REDIRECT_URL;

    // loginService 한개로
    private final KakaoLoginService kakaoLoginService;
    private final GoogleLoginService googleLoginService;
    private final UserLoginService userLoginService;

    @PostMapping("/google")
    public String loginUrlGoogle() {
        String reqUrl = "https://accounts.google.com/o/oauth2/v2/auth?client_id="
                + googleClientId
                + "&redirect_uri="
                + GOOGLE_REDIRECT_URL;

        return "redirect:" + reqUrl;
    }

    @GetMapping("/google")
    public String loginGoogle(@RequestParam(value = "code") String authCode, HttpSession session)
            throws Exception {
        ResponseEntity<GoogleInfResponseDto> userInfo = googleLoginService.getGoogleInfo(
                authCode);
        session.setAttribute("googleUserInfo", userInfo);

        return "redirect:checkSignUp";
    }

    @PostMapping("/kakao")
    public String loginUrlKakao() {
        String reqUrl = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id="
                + KAKAO_CLIENT_ID
                + "&redirect_uri="
                + KAKAO_REDIRECT_URL;

        return "redirect:" + reqUrl;
    }

    @GetMapping("/kakao")
    public String loginKakao(HttpServletRequest request, HttpSession session) throws Exception {
        KakaoDTO userInfo = kakaoLoginService.getKakaoInfo(request.getParameter("code"));
        session.setAttribute("kakaoUserInfo", userInfo);

        return "redirect:checkSignUp";
    }

    @GetMapping("/checkSignUp")
    public String checkGoogleSignUp(HttpSession session, Model model) throws Exception {

        String userEmail = "";

        if (session.getAttribute("googleUserInfo") != null) {
            ResponseEntity<GoogleInfResponseDto> userInfo = (ResponseEntity<GoogleInfResponseDto>) session.getAttribute(
                    "googleUserInfo");
            userEmail = userInfo.getBody().getEmail();
        } else if (session.getAttribute("kakaoUserInfo") != null) {
            KakaoDTO userInfo = (KakaoDTO) session.getAttribute("kakaoUserInfo");
            userEmail = userInfo.getEmail();
        }

        UserDto userDto = userLoginService.signinOauth(userEmail, session);

        if (userDto != null) {
            return "redirect:/";
        } else {
            model.addAttribute("userEmail", userEmail);
            String allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-+=<>?";
            String userPwd = RandomStringUtils.random(20, allowedCharacters);
            model.addAttribute("userPwd", userPwd);

            return "user/joinOauth";
        }
    }

}
