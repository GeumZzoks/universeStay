package com.universestay.project.user.service;

import com.universestay.project.review.dto.RoomReviewDto;
import java.util.List;
import java.util.Map;

public interface MyBookingService {

    List<Map<String, Object>> getMyBookingList(Map map) throws Exception;

    int writeRoomReview(RoomReviewDto dto) throws Exception;

    int updateReviewStatus(String booking_id) throws Exception;

    int updateBookingStatus() throws Exception;
}
