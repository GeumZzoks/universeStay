package com.universestay.project.user.service;

import com.universestay.project.user.dto.UserDto;

public interface UserInfoService {

    public UserDto getUserInfo(String email) throws Exception;

    public int updateUserInfo(UserDto userDto) throws Exception;
}
