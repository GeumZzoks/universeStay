package com.universestay.project.user.service;

import com.universestay.project.user.dao.UserWithdrawalDao;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserWithdrawalServiceImpl implements UserWithdrawalService {

    @Autowired
    UserWithdrawalDao userWithDrawalDao;

    /**
     * feature : 회원 탈퇴
     *
     * @param user_id
     * @return
     * @throws Exception
     */
    @Override
    public int withdrawal(String user_id, HttpSession session) throws Exception {
        // 1. 로그아웃한다.
        session.invalidate();

        // 2. 회원 상태를 활성에서 탈퇴로 변경한다.
        return userWithDrawalDao.deleteUser(user_id);
    }
}
