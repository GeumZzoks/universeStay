package com.universestay.project.review.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReviewDaoTest {

    @Autowired
    RoomReviewDao roomReviewDao;

    @Test
    public void roomReviewSelectAll() throws Exception {
        System.out.println(
                roomReviewDao.roomReviewSelectAll("a65b5ec4-39bb-4df9-a28a-6d6c7df28756"));
    }

}
