package com.universestay.project.user.service;

import com.universestay.project.user.dao.UserInfoDao;
import com.universestay.project.user.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    UserInfoDao userInfoDao;

    @Override
    public UserDto getUserInfo(String user_email) throws Exception {
        UserDto userInfo;
        try {
            userInfo = userInfoDao.getUserInfo(user_email);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception();
        }
        return userInfo;
    }
}
