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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
//@Controller
//@RequestMapping("/user")
public class UserLoginController2 {

//    @Autowired
    UserLoginService userLoginService; // 명확한 이름 지어주기 // 고민해보기

    @GetMapping("/loginForm")
    public String loginForm() {
        return "user/loginForm"; // 뷰 보여줌
    }

    @PostMapping("/login")
    public String login(String user_email, String user_pwd, String remember_id,
            HttpServletResponse response, HttpSession session,
            RedirectAttributes redirectAttributes) throws Exception {

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
        UserDto userInfo = userLoginService.signin(user_email, user_pwd, session);

        // 유저 상태 담기.
        String statusId = userInfo.getStatus_id();
        System.out.println("statusId = " + statusId);

        try {
            if (userInfo != null) { // 3. 로그인 시도 시

                // 회원 활동 상태(U01~04)에 따라 다른 로직 처리 필요 => 서비스로 넘기자.

                if (statusId.equals("UO1")) { // U01 : 활성상태
                    // 로그인 시 최근 로그인 날짜를 디비에 저장 ==========================================> 코드가 중복이 되면 중복을 없애는 방법도 고민해보자
                    userLoginService.userLastLogin(user_email);
                    return "redirect:/main.jsp"; // 메인으로 이동

                } else if (statusId.equals("U02")) { // U02 : 휴면상태
                    Map<String, String> statusError = new HashMap<>();
                    userLoginService.isCredentialsPresent(error, user_email, user_pwd);
                    // 서비스 호출

                    // 어떻게 잘 리턴해야 뷰에서
                    // "고객님은 휴면 상태입니다. 해제하시겠습니까?" 를 보여줄 수 있을까

                    // 해제 안하겠다 하면 다시 로그인폼을 보여주고

                    // 해제하겠다고 한다면, (뷰에서 버튼같은걸 눌러야겠지, 다시 이 로직을 타고. 어케 타게 하지 ? ) ==> 받아올 파라미터 값을 추가해야겠다. 버튼이 널이 아니면? 아니면 버튼에 submit같이 컨트롤러를 탈수있는 . .url을 적을 수 있나
                    //업데이트되는 쿼리문을 호출하면 되겠지, // 유저 활동상태도 바꾸고(U02 -> U01), 마지막 로그인 일자도 바꿔주고
                    // 그 후에 알럿창으로 "고객님의 휴면 상태가 해제되었습니다. 다시 로그인 해주시기 바랍니다" 를 띄우고
                    // 로그인 폼을 보여주면 될 것 같은데 => 다시 로그인 시켜야 최근로그인 일자를 저장할 수 있으니.

                    // 알럿창을 어케 설정하는지랑 어떻게 리턴해야할지를 고민해보자.

                    return "";
                } else if (statusId.equals("U03")) { // U03: 정지상태
                    // 휴면과 마찬가지로
                    // " 정지된 아이디입니다. 관리자에게 문의하세요" 를 보여주고
                    // 메인으로 가야되는 걸까, 1대일 문의 게시판? 같은걸로 가야되는 걸까. 조사해보자.
                    return "";
                } else { // U04: 탈퇴상태
                    // 휴면과 마찬가지로
                    // "탈퇴한 아이디 입니다. 관리자에게 문의하세요" 를 보여주고
                    // 메인으로 가야되는 걸까, 1대1 문의 게시판? 쪽으로 리턴해야되는 걸까.

                    return "";

                }
            }
            // 여기에 오는 경우가
            // 4. 사용자가 아이디 또는 비밀번호를 틀렸을 경우
            // 5. 사용자가 없는 회원정보로 로그인을 시도한 경우
            else { // 유저에게 에러메세지와 함께 다시 로그인폼을 보여준다.
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
