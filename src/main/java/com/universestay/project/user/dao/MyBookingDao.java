package com.universestay.project.user.dao;

import com.universestay.project.review.dto.RoomReviewDto;
import java.util.List;
import java.util.Map;

public interface MyBookingDao {

    List<Map<String, Object>> selectMyBookings(Map map) throws Exception;

    int insertRoomReview(RoomReviewDto dto) throws Exception;

    int updateReviewStatus(String booking_id) throws Exception;

}
