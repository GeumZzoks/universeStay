package com.universestay.project.user.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserWithdrawalServiceImplTest {

    @Autowired
    UserWithdrawalServiceImpl userWithdrawalService;

    @Test
    public void withdrawal() {
        // 유저를 선택한다.

        // 유저를 withdrawal한다

        // 유저의 상태가 'U04'로 바꼈는지 확인한다.
    }

}
