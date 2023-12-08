package com.universestay.project.user.service;

import com.universestay.project.user.dao.UserLoginDao;
import com.universestay.project.user.dto.UserDto;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

@Service
public class UserLoginServiceImpl implements UserLoginService {

    @Autowired
    UserLoginDao userLoginDao;

    public void setCookie(String user_email, String remember_id, HttpServletResponse response)
            throws Exception {

        Cookie cookie;
        if (remember_id != null) { // 쿠키 요청이 있으면 쿠키를 만들고 응답 객체에 담아 넘겨주기
            cookie = new Cookie("user_email", user_email);
            cookie.setMaxAge(60 * 60 * 24);
            response.addCookie(cookie);

        } else { // 없다면 쿠키 초기화
            cookie = new Cookie("user_email", "");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }

    @Override
    public void isCredentialsPresent(Map<String, String> error, String user_email, String user_pwd)
            throws Exception {

        if (!StringUtils.hasText(
                user_email)) { // => (user_email == null && user_email == "") 과 같은 코드
            error.put("user_email", "이메일 입력은 필수입니다."); // 이메일 인풋이 비었다면 맵에 저장
        }
        if (!StringUtils.hasText(user_pwd)) { // 패스워드도 마찬가지
            error.put("user_pwd", "비밀번호 입력은 필수입니다.");
        }
    }

    public UserDto signin(String user_email, String user_pwd, HttpSession session, Model model)
            throws Exception {

        // 로그인을 시도한 경우 중  3,4,5 상황이 있을 수 있음
        // 3. 사용자가 로그인 성공한 경우
        // 4. 사용자 아이디/비빌번호가 틀렸을 경우
        // 5. 사용자가 없는 회원정보로 로그인을 시도한 경우

        // 추가
        // 로그인을 시도한 회원의 활동 상태가 u02~04인 경우

        // 추후 회원가입처럼 hashcode를 사용해서 ? 로그인 시키는 방법으로 보수할 예정

        try {
            // 다오 호출 : 조회 시 유저 정보가 있을수도 있고, 없을 수도 있어, 조회해서 UserDto타입에 일단 담아 놓고
            UserDto userInfo = userLoginDao.selectUser(user_email);
            String statusId = userInfo.getStatus_id();

            // 만약 유저 정보가 널이 아니면 == 조회가 됐단 뜻
            if (userInfo != null) {
                String userEmail = userInfo.getUser_email();
                String userPwd = userInfo.getUser_pwd();

                // 그리고 일치하는 정보가 db에 있다면 => 3. 로그인이 문제없이 성공한 경우
                if (userEmail != null && user_pwd.equals(userPwd)) {

                    // 여기서 유저상태에 따른 다른 리턴값 처리?
                    // u02는 휴면 해제하면 세션에 저장하고 로그인되게 해야하니까.. 얘는 여기 아래에 안끼는 거지!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    if (statusId.equals("U03") || statusId.equals("U04")) {
//                        model.addAttribute("statusId", statusId); => 담지마 컨트롤러에서 담아보자.

                        // 널주니까 컨트롤러에서 에러가나 얘도 걍 디티오 객체를 주긴해야하네
                        // 세션에 저장하지 않고 디티오 반환
                        return userInfo;
                    }

                    session.setAttribute("user_email", user_email);
                    session.setMaxInactiveInterval(30 * 60);
                    return userInfo; // 세션에 저장 후 UserDto타입을 리턴
                } else { // 4. 아이디 또는 비밀번호가 일치하지 않는다면 null을 반환 (ctr에서 맞는 뷰 보여줌)
                    return null;
                }
            } else { // null이면 => 6.없는 회원정보(로그인/비밀번호)로 로그인을 시도한 경우
                return null; // null 반환(ctr에서 맞는 뷰 보여줌)
            }

        } catch (Exception e) {
            e.printStackTrace();
            // return null;
            throw new Exception();
        }
    }

    @Override
    public UserDto checkSignUp(String user_email) throws Exception {
        return userLoginDao.selectUser(user_email);
    }

    @Override
    public int userLastLogin(String user_email) throws Exception {
        return userLoginDao.updateLastLogin(user_email);
    }


}
