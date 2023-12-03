package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.LoginAdminDao;
import com.universestay.project.admin.dto.AdminDto;
import com.universestay.project.common.exception.CommonException;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginAdminServiceImpl implements LoginAdminService {

    private final LoginAdminDao loginAdminDao;

    @Autowired
    public LoginAdminServiceImpl(LoginAdminDao loginAdminDao) {
        this.loginAdminDao = loginAdminDao;
    }

    /**
     * feat: 관리자 유저 ID/PWD 확인
     *
     * @param userEmail, password, request
     * @return boolean
     * @throws Exception
     */
    @Override
    public boolean confirmUser(String userEmail, String password, HttpServletRequest request)
            throws CommonException {

        // username을 UUID로 변환하는 UUID 클래스(임의로 정한 숫자, Object.hashCode 조합)
//        String admin_id = Uuid.generateUUID(userEmail);
//        AdminDto adminDto = loginAdminDao.selectUser(admin_id);
        String admin_id = UUID.randomUUID().toString();
        AdminDto adminDto = loginAdminDao.selectUser(userEmail);
        System.out.println("adminDto = " + adminDto);

        // ID, PASSWORD 확인 및 세션 객체 생성
        if (checkUserAccountIdPwd(adminDto, userEmail, password)) {

            // TODO: 중복 로그인 체크 후 세션 하나만 살리기
            // 세션 객체 생성 및 1시간 동안 유효
            HttpSession session = request.getSession();
            session.setAttribute("admin_email", userEmail);
            session.setMaxInactiveInterval(3600);

            return true;
        }

        return false;

    }

    private boolean checkUserAccountIdPwd(AdminDto adminDto, String userEmail, String password) {
        // TODO: Optional 객체로 변환하기
        if (adminDto == null) {
            return false;
        }

        return (adminDto.getAdmin_email().equals(userEmail) && adminDto.getAdmin_pwd()
                .equals(password));
    }
}
