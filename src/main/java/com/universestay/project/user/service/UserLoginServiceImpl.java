package com.universestay.project.user.service;

import com.universestay.project.user.dao.UserLoginDao;
import com.universestay.project.user.dto.UserDto;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class UserLoginServiceImpl implements UserLoginService {

    @Autowired
    UserLoginDao userLoginDao;

    public void setCookie(String user_email, String remember_id, HttpServletResponse response)
            throws Exception {
        Cookie cookie;
        // 쿠키 : 파라미터로 받아옴
        if (remember_id != null) {
            cookie = new Cookie("user_email", user_email);
            cookie.setMaxAge(60 * 60 * 24);
            response.addCookie(cookie);

        } else {
            cookie = new Cookie("user_email", "");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }

    @Override
    public void isCredentialsPresent(Map<String, String> error, String user_email, String user_pwd)
            throws Exception {
        if (!StringUtils.hasText(user_email)) {
            error.put("user_email", "이메일 입력은 필수입니다.");
        }
        if (!StringUtils.hasText(user_pwd)) {
            error.put("user_pwd", "비밀번호 입력은 필수입니다.");
        }
    }

    public UserDto signin(String user_email, String user_pwd, HttpSession session)
            throws Exception {
        // 로그인 처리
        // 다오 호출 : 유저가 입력한 정보가 있는지 조회
        // 쿠키처리, 결과가 일치하면 session에 저장

        try {
            UserDto userInfo = userLoginDao.selectUser(user_email);
            // 원하는 값만 꺼내기
            String userEmail = userInfo.getUser_email();
            String userPwd = userInfo.getUser_pwd();

            // 일치하는 정보가 db에 있다면 session에 저장 후 리턴
            if (userEmail != null && user_pwd.equals(userPwd)) {
                session.setAttribute("user_email", user_email);
                session.setMaxInactiveInterval(30 * 60);
                return userInfo;
            } else {
                return null;
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception();
        }
    }
}
