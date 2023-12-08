package com.universestay.project.user.dao;

import com.universestay.project.user.dto.UserDto;

public interface UserWithdrawalDao {

    int deleteUser(String user_email) throws Exception;

    UserDto selectUserByUuid(String uuid) throws Exception;
}
