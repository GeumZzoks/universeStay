package com.universestay.project.review.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RoomReviewServiceTest {

    @Autowired
    RoomReviewService roomReviewService;

    @Test
    public void getList() throws Exception {
        System.out.println(
                roomReviewService.getRoomReviewList("a65b5ec4-39bb-4df9-a28a-6d6c7df28756"));
    }
}
