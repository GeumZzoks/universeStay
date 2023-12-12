package com.universestay.project.review.dao;

import com.universestay.project.review.dto.RoomReviewDto;
import java.util.List;
import java.util.Map;

public interface RoomReviewDao {

    // 숙소 리뷰 목록
    List<RoomReviewDto> roomReviewSelectAll(String room_id) throws Exception;

    // 숙소 리뷰 등록
//    int insert(RoomReviewDto roomReviewDto) throws Exception;

    List<Map<String, Object>> userReviewSelectAll(String user_id) throws Exception;

}
