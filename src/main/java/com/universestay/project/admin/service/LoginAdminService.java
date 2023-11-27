package com.universestay.project.admin.service;

import javax.servlet.http.HttpServletRequest;

public interface LoginAdminService {

    boolean confirmUser(String username, String password, HttpServletRequest request)
            throws Exception;

}
