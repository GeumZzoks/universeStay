package com.universestay.project.admin.dao;

import com.universestay.project.admin.dto.SearchCondition;
import com.universestay.project.user.dto.UserDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertTrue;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserManagementDaoImplTest {

    @Autowired
    UserManagementDao userManagementDao;

    @Test
    public void countUser() throws Exception {
        int result = userManagementDao.countUser();
        System.out.println("result : " + result);
        assertTrue(result >= 0);
    }

    @Test
    public void selectUser() throws Exception {
        UserDto dto = new UserDto();
        System.out.println("before dto = " + dto);
        dto = userManagementDao.selectUser("0ca24692-89ea-11ee-b9d1-0242ac125001");
        System.out.println("after dto = " + dto);
        assertTrue(dto != null);
    }

    @Test
    public void updateUser() throws Exception {
        UserDto dto = new UserDto();
        dto = userManagementDao.selectUser("0ca24692-89ea-11ee-b9d1-0242ac125001");
        dto.setUser_pwd("hihihi");
        int result = userManagementDao.updateUser(dto);
        System.out.println("result = " + result);
        assertTrue(result == 1);
    }

    @Test
    public void insertUser() throws Exception {
        for (int i = 60; i < 73; i++) {
            UserDto user = new UserDto();
            user.setUser_id("0ca24692-89ea-11ee-b9d1-0242ac1250" + i);
            user.setStatus_id("U03");
            user.setUser_pwd("pwd00" + i);
            user.setUser_nickname("nickname00" + i);
            user.setUser_name("name00" + i);
            user.setUser_email("test00" + i + "@gmail.con");
            user.setUser_phone_num1("010-1234-000" + i);
            user.setUser_address("서울시 송파구 잠실동");
            user.setUser_birth(new Date(1999, 1, 1));
            user.setUser_is_certificated("N");
            user.setUser_is_host("N");
//        user.setCreated_at();
//        user.setUpdated_at();
            user.setCreated_id("who??");
            user.setUpdated_id("who??");
            System.out.println(user.toString());
            int result = 0;
            result = userManagementDao.insertUser(user);
            System.out.println("result = " + result);
            assertTrue(result == 1);
        }
    }

    @Test
    public void deleteUser() throws Exception {
        int result = userManagementDao.deleteUser("0ca24692-89ea-11ee-b9d1-0242ac125001");
        System.out.println("result = " + result);
        assertTrue(result == 1);
    }

    @Test
    public void selectPage() throws Exception {
        List<UserDto> list = null;
        Map map = new HashMap();
        System.out.println("before list = " + list);
        System.out.println("before map = " + map);
        map.put("offset", 10);
        map.put("pageSize", 10);
        list = userManagementDao.selectPage(map);
        System.out.println("after list = ");
        for(UserDto dto : list){
            System.out.println("dto = " + dto);
        }
        System.out.println("after map = " + map);
        assertTrue(list != null);
    }

    @Test
    public void selectAll() throws Exception {
        List<UserDto> list = null;
        userManagementDao.selectAll();
        assertTrue(list != null);
    }

    @Test
    public void searchResultCount() throws Exception {
        SearchCondition sc = new SearchCondition(1, 10);
//        sc.setPage(1);
//        sc.setPageSize(10);
//        sc.setOption("user_nickname");
//        sc.setKeyword("nickname002");
        sc.setOption("status_id");
        sc.setKeyword("U03");
        int result = -1;
        result = userManagementDao.searchResultCount(sc);
        System.out.println("result = " + result);
        assertTrue(result != -1);
    }

    @Test
    public void searchSelectPage() throws Exception {
        SearchCondition sc = new SearchCondition(2, 10, "status_id", "U03");
//        sc.setPage(2);
//        sc.setPageSize(10);
//        sc.setOption("status_id");
//        sc.setKeyword("U03");
        List<UserDto> list = null;
        System.out.println("before list = " + list);
        list = userManagementDao.searchSelectPage(sc);
        System.out.println("after list = " + list);
        assertTrue(list != null);
    }
}