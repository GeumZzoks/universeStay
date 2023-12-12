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
                roomReviewService.getRoomReviewList("a65b5ec4-39bb-4df9-a28a-6d6c7df28756"));
    }

//    @Test
//    public void 숙소_리뷰등록() throws Exception {
//        RoomReviewDto roomReviewDto = new RoomReviewDto();
//        roomReviewDto.setReview_id(UUID.randomUUID().toString());
//        roomReviewDto.setUser_id("065b5ec4-39bb-4df9-a28a-6d6c7df28796");
//        roomReviewDto.setRoom_id("ggggggg-ea79-4dff-80a4-b12eb846bf41");
//        roomReviewDto.setReview_writer("065b5ec4-39bb-4df9-a28a-6d6c7df28796");
//        roomReviewDto.setReview_stars(4);
//        roomReviewDto.setReview_ctt("진~~~~~짜 잘 쉬다 갑니다.");
//        roomReviewDto.setCreated_id("065b5ec4-39bb-4df9-a28a-6d6c7df28796");
//        roomReviewDto.setUpdated_id("065b5ec4-39bb-4df9-a28a-6d6c7df28796");
//        System.out.println("INSERT COUNT : " + roomReviewService.write(roomReviewDto));
//    }

    @Test
    public void 유저_내가작성한리뷰목록_불러오기() throws Exception {
        System.out.println(
                roomReviewService.getUserReviewList("065b5ec4-39bb-4df9-a28a-6d6c7df28796"));
    }
}
