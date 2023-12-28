package com.universestay.project.user.service;

import com.universestay.project.user.dto.UserDto;

public interface JoinService {

    int registerUser(UserDto userDto) throws Exception;

    int checkNickname(String user_nickname) throws Exception;

    int checkEmail(String user_email) throws Exception;
}
