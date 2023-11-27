package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.LoginAdminDao;
import com.universestay.project.admin.dto.AdminDto;
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
     * feature : admin user 확인
     *
     * @param id, password, request
     * @return boolean
     * @throws Exception
     */
    @Override
    public boolean confirmUser(String id, String password, HttpServletRequest request)
            throws Exception {

        // TODO: username을 UUID로 변환

        AdminDto adminDto = loginAdminDao.selectUser(id);
        System.out.println("adminDto = " + adminDto);

        // TODO: Optional 객체로 변환하기
        if (adminDto == null) {
            return false;
        }

        String DbAdminId = adminDto.getAdmin_id();
        String DbAdminPwd = adminDto.getAdmin_pwd();
        if (DbAdminId.equals(id) && DbAdminPwd.equals(password)) {

            // 세션 객체 얻기 및 저장
            HttpSession session = request.getSession();
            session.setAttribute("id", id);
            session.setMaxInactiveInterval(3600);
            return true;
        }

        return false;

    }
}
