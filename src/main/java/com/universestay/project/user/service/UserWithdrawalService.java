package com.universestay.project.user.service;

import javax.servlet.http.HttpSession;

public interface UserWithdrawalService {

    public int withdrawal(String user_id, HttpSession session) throws Exception;
}
