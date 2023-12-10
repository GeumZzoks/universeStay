//package com.universestay.project.room.dao;
//
//import com.universestay.project.room.dto.RoomDto;
//import java.util.List;
//import java.util.Map;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
//public class RoomDaoImplTest {
//
//    @Autowired
//    RoomDao roomDao;
//
//    @Test
//    public void listHostRoom() throws Exception {
//        List<RoomDto> roomList = roomDao.listHostRoom("nn16d376-ea79-4dff-80a4-b12eb846bf41");
//        assertTrue(roomList != null);
//    }
//
//    @Test
//    public void listHostRoom() throws Exception {
//        System.out.println(" 여기로 들어왔니 ");
//        List<Map<String, Object>> roomList = roomDao.listHostRoom(
//                "nn16d376-ea79-4dff-80a4-b12eb846bf41");
//        System.out.println("두번째ㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐ");
//        assertTrue(roomList != null);
//    }
//}