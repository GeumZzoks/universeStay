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

    // view 에서 구글로 로그인 버튼을 누르면 method="post", action="/oauth2/google" 로 전달되고
    // 아래의 @RequestMapping을 통과하게 된다. googleClientId, GOOGLE_REDIRECT_URL을 활용해서
    // 리다이렉트하여 인가(리소스에 접근할 수 있는 권한) 승인을 요청한다.
    // 로그인하면 인가 승인을 하여 (인증 코드를 파라미터로 보내준다.)
    //  GOOGLE_REDIRECT_URL로 리다이렉트 (인증코드는 파라미터에 포함되어있다.)
    @PostMapping("/google")
    public String loginUrlGoogle() {
        String reqUrl = "https://accounts.google.com/o/oauth2/v2/auth?client_id="
                + googleClientId
                + "&redirect_uri="
                + GOOGLE_REDIRECT_URL;

        System.out.println(reqUrl);

        return "redirect:" + reqUrl;
    }

    // GOOGLE_REDIRECT_URL로 리다이렉트시에 아래 @RequestMapping을 통과한다.
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
            ResponseEntity<GoogleInfResponseDto> userInfo = (ResponseEntity<GoogleInfResponseDto>) session.getAttribute("googleUserInfo");
            userEmail = userInfo.getBody().getEmail();
        }
        else if (session.getAttribute("kakaoUserInfo") != null) {
            KakaoDTO userInfo = (KakaoDTO) session.getAttribute("kakaoUserInfo");
            userEmail = userInfo.getEmail();
        }

        UserDto userDto = userLoginService.checkSignUp(userEmail);

        if (userDto != null) {
            // 있으면 로그인 하고 홈
            String userPwd = userDto.getUser_pwd();
            userLoginService.signin(userEmail, userPwd, session);

            return "HI";
        } else {
            // 없으면 이메일 정보 가지고 회원가입 폼으로 이동
            model.addAttribute("userEmail", userEmail);
//            model.addAttribute("userPwd", userPwd);

            return "user/join";
        }
    }

}
