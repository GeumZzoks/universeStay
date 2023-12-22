package com.universestay.project.review.dao;

import java.util.List;
import java.util.Map;

public interface RoomReviewDao {

    // 숙소 리뷰 목록
    List<Map<String, Object>> roomReviewSelectAll(String room_id) throws Exception;

    // 유저 리뷰 목록
    List<Map<String, Object>> userReviewSelectAll(String user_id) throws Exception;

    // 숙소 리뷰 갯수
    int roomReviewCount(String room_id) throws Exception;

    // 숙소 리뷰 평균
    double roomReviewAvg(String room_id) throws Exception;

    List<Map<String, Object>> roomReviewSelectSix(String room_id) throws Exception;

}
