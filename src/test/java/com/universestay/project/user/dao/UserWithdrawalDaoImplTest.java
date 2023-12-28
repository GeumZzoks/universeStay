package com.universestay.project.user.dao;

import org.junit.Assert;
import org.junit.Test;
import org.junit.jupiter.api.DisplayName;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserWithdrawalDaoImplTest {

    @Autowired
    UserWithdrawalDao userWithdrawalDao;

    @Test
    @DisplayName("유저 삭제 테스트")
    @Transactional
    public void deleteUser() {
        // 유저를 선택한다.

        // 유저를 delete한다

        // 유저의 상태가 'U04'로 바꼈는지 확인한다.
    }
}
