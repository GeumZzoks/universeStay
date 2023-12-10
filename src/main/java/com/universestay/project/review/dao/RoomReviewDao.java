package com.universestay.project.review.dao;

import com.universestay.project.review.dto.RoomReviewDto;
import java.util.List;

public interface RoomReviewDao {

    // 숙소 리뷰 목록
    List<RoomReviewDto> roomReviewSelectAll(String room_id) throws Exception;

}
