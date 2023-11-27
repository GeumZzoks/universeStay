package com.universestay.project.user.service;

import com.universestay.project.user.dao.UserJoinDao;
import com.universestay.project.user.dto.UserDto;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinServiceImpl implements JoinService {

    @Autowired
    UserJoinDao userJoinDao;

    @Override
    public int registerUser(UserDto userDto) throws Exception {
        System.out.println("service");
        System.out.println(userDto.getUser_img_url());

        String uuid = UUID.randomUUID().toString();
        String status_id = "U01";
        //   UserDto userDto = new UserDto();
        userDto.setUser_id(uuid);
        userDto.getUser_nickname();
        userDto.getUser_pwd();
        userDto.getUser_name();
        userDto.getUser_address();
        userDto.getUser_email();
        userDto.getUser_phone_num1();
        userDto.getUser_phone_num2();
        userDto.getUser_birth();
        userDto.setStatus_id(status_id);
        userDto.setCreated_id(uuid);
        userDto.setUpdated_id(uuid);
        userDto.getUser_img_url();

        return userJoinDao.insertUser(userDto);
    }

    @Override
    public int checkNickname(String user_nickname) throws Exception {
        int result = 0;

        System.out.println("user_nickname = " + user_nickname);
        result = userJoinDao.checkNickname(user_nickname);
        return result;
    }
}
