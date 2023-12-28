package com.universestay.project.admin.dao;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class RegisterDaoImplTest {

//    AdminDto adminDto = new AdminDto("0ca24692-89ea-11ee-b9d1-0242ac120001", "nick", "1234",
//            "010-3135-9103", "alskadmlcraz1@gmail.com",
//            new Timestamp(System.currentTimeMillis()),
//            "0ca24692-89ea-11ee-b9d1-0242ac120002",
//            new Timestamp(System.currentTimeMillis()),
//            "0ca24692-89ea-11ee-b9d1-0242ac120002");

//    @Autowired
//    private RegisterDao registerDao;
//
//    /* TEST 메서드 실행 시 매번 각각 실행 */
//    /* CRUD 의 DELETE 는 해당 메서드로 대체 */
//    @Test
//    @Before
//    public void initTest() {
//        /* 데이터 추가 */
//
//        assertTrue(registerDao.deleteUser("0ca24692-89ea-11ee-b9d1-0242ac120001") == 1);
//        System.out.println("TEST야");
////        registerDao.deleteUserAll();
//    }
//
//    @Test
//    public void insertUser() {
//        /* 데이터 추가 */
//        assertTrue(registerDao.insertUser(adminDto) == 1);
//    }
//
//    @Test
//    public void selectUser() {
//        /* 데이터 추가 */
//        assertTrue(registerDao.insertUser(adminDto) == 1);
//
//        assertTrue(registerDao.selectUser("0ca24692-89ea-11ee-b9d1-0242ac120001") == 1);
//    }
//
//    @Test
//    public void updateUser() {
//        /* 데이터 추가 */
//        assertTrue(registerDao.insertUser(adminDto) == 1);
//
//        /* setter를 이용해 객체 데이터 변경 */
//        adminDto.setAdmin_nickname("nickhealthy");
//        adminDto.setAdmin_pwd("1021");
//
//        /* DB 값 조회 시,
//        admin_nickname: nickhealthy
//        admin_pwd: 1021 로 변경되서 조회됨
//        */
//        assertTrue(registerDao.updateUser(adminDto) == 1);
//    }
}