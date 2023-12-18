package com.universestay.project.user.service;

import com.universestay.project.user.dto.UserDto;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface UserInfoService {

    public UserDto getUserInfo(String email) throws Exception;

    public int updateUserInfo(MultipartFile img, UserDto userDto) throws Exception;

    public String checkNickname(String user_email, String user_nickname) throws Exception;

    public String changePwd(String check_pwd, String new_pwd, String new_pwd2,
            HttpSession httpSession)
            throws Exception;
}
