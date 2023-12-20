package com.universestay.project.user.service;

import com.universestay.project.user.dao.UserLoginDao;
import com.universestay.project.user.dto.UserDto;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import java.util.Map;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

@Service
public class UserLoginServiceImpl implements UserLoginService, PasswordEncryption {

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

        if (!StringUtils.hasText(user_email)) { //(user_email == null && user_email == "")
            error.put("user_email", "이메일 입력은 필수입니다."); //인풋이 비었다면 맵에 에러메세지 담기
        }
        if (!StringUtils.hasText(user_pwd)) {
            error.put("user_pwd", "비밀번호 입력은 필수입니다.");
        }
    }

    public UserDto signin(String user_email, String user_pwd, HttpSession session, Model model)
            throws Exception {

        // 로그인을 시도한 경우 3,4,5 상황이 있을 수 있음
        // 3. 로그인 성공한 경우
        // 4. 아이디/비빌번호가 틀렸을 경우
        // 5. 없는 회원정보로 로그인을 시도한 경우
        // 추가
        // 로그인을 시도한 회원의 활동 상태가 u02~04인 경우

        try {
            // 유저가 입력한 이메일 정보로 디비 조회
            UserDto userInfo = userLoginDao.selectUser(user_email);
            // 유저 활동 상태 확인
            String statusId = userInfo.getStatus_id();

            // 유저 정보가 조회 됐으면
            if (userInfo != null) {
                String userEmail = userInfo.getUser_email();
                String userPwd = userInfo.getUser_pwd();
                String userId = userInfo.getUser_id();

                // 암호화된 비밀번호로 바꿔주기
                String encrypt_pwd = encrypt(user_email, user_pwd);

                // 3. 로그인이 문제없이 성공한 경우
                if (userEmail != null && encrypt_pwd.equals(userPwd)) {

                    // 회원 정지 상태 또는 탈퇴 상태가 아니라면
                    if (statusId.equals("U03") || statusId.equals("U04")) {

                        // 세션에 저장하지 않고 반환
                        return userInfo;
                    }
                    // 세션에 저장
                    session.setAttribute("user_email", user_email);
                    session.setAttribute("user_id", userId);
                    session.setMaxInactiveInterval(30 * 60);
                    return userInfo;

                    // 4. 아이디 또는 비밀번호가 일치하지 않는다면 null을 반환하여 컨트롤러에서 뷰 처리
                } else {
                    return null;
                }

                // 6.없는 회원정보(로그인/비밀번호)로 로그인을 시도한 경우
            } else {
                return null; // null을 반환하여 컨트롤러에서 뷰 처리
            }

            // 위 상황에서 null 발생시에도 null을 반환하여 컨트롤러에서 뷰 처리
        } catch (Exception e) {
            e.printStackTrace();
            return null;
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


    @Override
    public String encrypt(String email, String password) {
        try {
            KeySpec spec = new PBEKeySpec(password.toCharArray(), getSalt(email), 85319, 128);
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");

            byte[] hash = factory.generateSecret(spec).getEncoded();
            return Base64.getEncoder().encodeToString(hash);
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException |
                 InvalidKeySpecException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public byte[] getSalt(String email)
            throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest digest = MessageDigest.getInstance("SHA-512");
        byte[] keyBytes = email.getBytes("UTF-8");

        return digest.digest(keyBytes);
    }
}
