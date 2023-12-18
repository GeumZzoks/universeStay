package com.universestay.project.user.controller;

import com.universestay.project.room.service.RoomService;
import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.ProfileImgService;
import com.universestay.project.user.service.UserLoginService;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserLoginController {

    @Autowired
    UserLoginService userLoginService;
    @Autowired
    ProfileImgService profileImgService;
    @Autowired
    RoomService roomService;

    @GetMapping("/loginForm")
    public String loginForm() {
        return "user/loginForm"; // 뷰 보여줌
    }

    @PostMapping("/login")
    public String login(String user_email, String user_pwd, String remember_id,
            HttpServletResponse response, HttpSession session,
            RedirectAttributes redirectAttributes, Model model) throws Exception {

        // 1. 쿠키 요청이 있는지 먼저 확인
        userLoginService.setCookie(user_email, remember_id, response);

        // 2. 유저가 인풋에 값을 제대로 입력했는지 확인 // 제대로 입력하지 않았다면, 서비스에서 에러메세지를 받아올 맵을 만들어 전달
        Map<String, String> error = new HashMap<>();
        userLoginService.isCredentialsPresent(error, user_email, user_pwd);

        // 에러가 있으면(아이디/비번 입력이 안된 경우) 리다이렉트객체에 추가 후 뷰에 전달
        if (!error.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", error);
            return "redirect:/user/loginForm";
        }

        // 사용자가 로그인을 시도하면 DB 조회
        UserDto userInfo = userLoginService.signin(user_email, user_pwd, session, model);
        // 유저 상태 담기
        String statusId = userInfo.getStatus_id();

        try {
            if (userInfo != null) { // 3. 로그인 시도 시

                // 회원탈퇴한 유저가 로그인 시도 시 메인으로 이동 후 알럿창 띄우기
                if (statusId.equals("U02")) {
                    userLoginService.userLastLogin(user_email);
                }
                if (!statusId.equals("U01")) {
                    redirectAttributes.addFlashAttribute("statusId", statusId);
                    return "redirect:/";
                }

                // 정상적으로 로그인 됐을 때,
                userLoginService.userLastLogin(user_email);

                return "redirect:/";

            }
            // 여기에 오는 경우가
            // 4. 사용자가 아이디 또는 비밀번호를 틀렸을 경우
            // 5. 사용자가 없는 회원정보로 로그인을 시도한 경우
            else { // 유저에게 에러메세지와 함께 다시 로그인폼을 보여준다.

                // 서비스임플에서 uo2,u04일때 널을 보내서 여기서 처리할라니까. 겟아이디가 없으니 널포인트 익셉션이 난다.

                error.put("id null or pwd invalid", "아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다.");
                redirectAttributes.addFlashAttribute("error", error);
                return "redirect:/user/loginForm";
            }
            // 뷰처리
        } catch (Exception e) {
            e.printStackTrace();

            // 원장님 피드백 있는 부분 : 리턴을 통일 있게 하거나, 아니면 어떤 이유가 있어서 뉴익셉션 발생시키는건지. 내가 어떤걸하고 싶은지를 잘 알고 있어야 할듯.
            return "redirect:/user/loginForm";
//            throw new Exception();
//            return null; // => 리턴 사용 예) 우리가 정의한 에러페이지가 있다면 보여주면 되는데, 없으니까 안 사용
        } // 화면

    }
}
