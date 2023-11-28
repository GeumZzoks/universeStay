package com.universestay.project.user.dao;

import com.universestay.project.user.dto.UserDto;

public interface UserLoginDao {

    public UserDto selectUser(String user_email) throws Exception;


}
