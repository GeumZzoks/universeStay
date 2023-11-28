package com.universestay.project.user.dao;

import com.universestay.project.user.dto.UserDto;

public interface UserInfoDao {

    public UserDto getUserInfo(String user_email) throws Exception;

}
