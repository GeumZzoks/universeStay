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
    public void 숙소_리뷰목록_불러오기() throws Exception {
        System.out.println(
                roomReviewService.getRoomReviewList("468b1cd5-9bc1-45d3-a51c-a1d8592852f2"));
    }

    @Test
    public void 유저_내가작성한리뷰목록_불러오기() throws Exception {
        System.out.println(
                roomReviewService.getUserReviewList("065b5ec4-39bb-4df9-a28a-6d6c7df28796"));
    }

    @Test
    public void 숙소_리뷰개수() throws Exception {
        System.out.println(
                roomReviewService.getRoomReviewCount("165b5ec4-39bb-4df9-a28a-6d6c7df28756"));
    }

    @Test
    public void 숙소_리뷰평균() throws Exception {
        System.out.println(
                roomReviewService.getRoomReviewAvg("165b5ec4-39bb-4df9-a28a-6d6c7df28756"));
    }

    @Test
    public void 속소_최근6개리뷰_불러오기() throws Exception {
        System.out.println(
                roomReviewService.getRoomReviewSix("468b1cd5-9bc1-45d3-a51c-a1d8592852f2")
        );
    }

}
