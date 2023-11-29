package com.universestay.project.user.dao;

import static org.junit.Assert.*;

import com.universestay.project.user.dto.UserDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserLoginDaoImplTest {

    @Autowired
    UserLoginDao userLoginDao;

    @Test
    public void selectUser() throws Exception {
        // DB에 유저정보가 있는지 확인
        // 디비에 진짜 있는 정보 val@gmail.com
        UserDto userDto = userLoginDao.selectUser("val@gmail.com");
        assertTrue(userDto != null);
    }

    @Test
    public void updateLastLogin() throws Exception {
        Integer plzSuccess = userLoginDao.updateLastLogin("abc@abc.com");
        assertTrue(plzSuccess == 1);
    }
}