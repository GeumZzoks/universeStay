package com.universestay.project.user.service;

import com.universestay.project.user.dao.UserJoinDao;
import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.dto.UserRequestDto;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinServiceImpl implements JoinService {

    @Autowired
    UserJoinDao userJoinDao;

    @Override
    public int registerUser(UserRequestDto userRequestDto) throws Exception {
        System.out.println("service");

        String uuid = UUID.randomUUID().toString();
        String status_id = "U01";
        UserDto userDto = new UserDto();
        userDto.setUser_id(uuid);
        userDto.setUser_nickname(userRequestDto.getUser_nickname());
        userDto.setUser_pwd(userRequestDto.getUser_pwd());
        userDto.setUser_name(userRequestDto.getUser_name());
        userDto.setUser_address(userRequestDto.getUser_address());
        userDto.setUser_email(userRequestDto.getUser_email());
        userDto.setUser_phone_num1(userRequestDto.getUser_phone_num1());
        userDto.setUser_phone_num2(userRequestDto.getUser_phone_num2());
        userDto.setUser_birth(userRequestDto.getUser_birth());
        userDto.setStatus_id(status_id);
        userDto.setCreated_id(uuid);
        userDto.setUpdated_id(uuid);

        return userJoinDao.insertUser(userDto);
    }
}
