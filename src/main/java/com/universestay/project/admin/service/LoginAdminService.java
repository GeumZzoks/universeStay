package com.universestay.project.admin.service;

import com.universestay.project.common.exception.CommonException;
import javax.servlet.http.HttpServletRequest;

public interface LoginAdminService {

    boolean confirmUser(String userEmail, String password, HttpServletRequest request)
            throws CommonException;

}
