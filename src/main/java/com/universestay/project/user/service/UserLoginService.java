package com.universestay.project.user.service;

import com.universestay.project.user.dto.UserDto;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface UserLoginService {

    public void setCookie(String user_email, String remember_id, HttpServletResponse response)
            throws Exception;

    public void isCredentialsPresent(Map<String, String> error, String user_email, String user_pwd)
            throws Exception;

    public UserDto signin(String user_email, String user_pwd, HttpSession session) throws Exception;

    public UserDto checkSignUp(String user_email) throws Exception;

    public int userLastLogin(String user_email) throws Exception;

}
