package com.universestay.project.user.dao;

import com.universestay.project.user.dto.UserDto;

public interface UserJoinDao {

    int insertUser(UserDto userDto) throws Exception;

    int checkNickname(String user_nickname) throws Exception;
}
