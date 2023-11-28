//package com.universestay.project.user.dao;
//
//import com.universestay.project.user.dto.UserDto;
//import java.sql.Date;
//import java.sql.Timestamp;
//import org.junit.Assert;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
////@Transactional
////@Rollback
//public class UserInfoDaoImplTest {
//
//    @Autowired
//    UserJoinDao userJoinDao;
//    @Autowired
//    UserInfoDao userInfoDao;
//
//    @Test
//    public void selectUserInfo() throws Exception {
//        UserDto userDto = new UserDto();
//        userDto.setUser_id("0ca24692-89ea-11ee-b9d1-0242ac120001");
//        userDto.setUser_nickname("랸나");
//        userDto.setUser_pwd("1234");
//        userDto.setUser_name("류한나");
//        userDto.setUser_email("abc@abc.com");
//        userDto.setUser_phone_num1("010-1234-1111");
//        userDto.setUser_phone_num2("010-1021-10221");
//        userDto.setUser_address("경기도 남양주시");
//        userDto.setUser_birth(new Date(1998, 01, 12));
//        userDto.setUser_img_url("url");
//        userDto.setStatus_id("U01");
//        userDto.setCreated_at(new Timestamp(System.currentTimeMillis()));
//        userDto.setUpdated_at(new Timestamp(System.currentTimeMillis()));
//        userDto.setCreated_id("생성한사람");
//        userDto.setUpdated_id("업데이트한사람");
//
//        userJoinDao.insertUser(userDto);
//        System.out.println(userDto.toString());
//        UserDto user = userInfoDao.getUserInfo("abc@abc.com");
//        Assert.assertTrue(user.getUser_id() == "0ca24692-89ea-11ee-b9d1-0242ac120001");
//
//    }
//}
