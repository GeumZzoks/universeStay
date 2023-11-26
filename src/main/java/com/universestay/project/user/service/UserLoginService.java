package com.universestay.project.user.service;

import com.universestay.project.user.dto.UserDto;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface UserLoginService {

    public UserDto signin(String user_id, String user_pwd, String remember_id,
            HttpServletResponse response, HttpSession session) throws Exception;

}
