package com.universestay.project.user.controller;

import com.universestay.project.room.service.RoomService;
import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.ProfileImgService;
import com.universestay.project.user.service.UserLoginService;
import java.util.HashMap;
import java.util.List;
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
    UserLoginService userLoginService; // 명확한 이름 지어주기 // 고민해보기
    @Autowired
    ProfileImgService profileImgService;
    @Autowired
    RoomService roomService;

    @GetMapping("/loginForm")
    public String loginForm() {
        return "user/loginForm";
    }

    @PostMapping("/login")
    public String login(String user_email, String user_pwd, String remember_id,
            HttpServletResponse response, HttpSession session,
            RedirectAttributes redirectAttributes, Model model) throws Exception {

        // 1. 쿠키 요청이 있는지 먼저 확인
        userLoginService.setCookie(user_email, remember_id, response);

        // 2. 유저가 인풋에 값을 제대로 입력 했는지 확인 => 제대로 입력하지 않았다면, 서비스에서 에러메세지를 담아올 맵 전달
        Map<String, String> error = new HashMap<>();
        userLoginService.isCredentialsPresent(error, user_email, user_pwd);

        // 에러가 있으면(아이디/비번 입력이 안된 경우) 리다이렉트객체에 에러 메세지 추가 후 뷰에 전달
        if (!error.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", error);
            return "redirect:/user/loginForm";
        }

        // 사용자가 입력한 로그인 정보로 DB 조회
        UserDto userInfo = userLoginService.signin(user_email, user_pwd, session, model);

        try {
            if (userInfo != null) { // 3. 로그인 시도 시
                String statusId = userInfo.getStatus_id();

                // 회원 상태가 정지, 탈퇴라면 유저 상태값을 뷰에 전달하여 관리자에게 문의 알럿창 띄우기
                if (!statusId.equals("U01")) {
                    model.addAttribute("statusId", statusId);
                    return "main/main";
                }

                // 회원 상태가 휴면이거나, 활성상태로 로그인 됐을 때, 최근 로그인일자 업데이트
                // 휴면 상태인 경우 뷰에서 휴면 해제에 대한 알럿창을 띄워준다.
                userLoginService.userLastLogin(user_email);
                String profileImgUrl = profileImgService.getProfileImgUrl(userInfo.getUser_id());

                model.addAttribute("profileImgUrl", profileImgUrl);
                model.addAttribute("user", userInfo);

                List<Map<String, Object>> roomList = roomService.lookUpAllRoom(
                        userInfo.getUser_id());
                model.addAttribute("roomList", roomList);

                return "/main/main";
//                throw new Exception("예기치 못한 에러 발생"); => error2 발생 시키기
//                return "redirect:/~"; => 사용하고자 한다면 redirectAttributes 필요

            }
            // 로그인 시도 시
            // 4. 아이디 또는 비밀번호를 틀렸을 경우
            // 5. 없는 회원정보로 로그인을 시도한 경우
            // 유저에게 에러메세지와 함께 다시 로그인폼을 보여준다.
            else {
                error.put("id null or pwd invalid", "아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다.");
                redirectAttributes.addFlashAttribute("error", error);
                return "redirect:/user/loginForm";
            }
            // 뷰처리
        } catch (Exception e) {
            e.printStackTrace();
            // 예상치 못한 에러가 발생했을 때, 사용자에게 알려주기
            redirectAttributes.addFlashAttribute("error2", "죄송합니다. 서버에 장애가 발생했습니다. 다시 시도 해주세요.");
            return "redirect:/user/loginForm";
        }

    }
}
