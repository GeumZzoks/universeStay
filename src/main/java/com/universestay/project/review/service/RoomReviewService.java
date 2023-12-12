package com.universestay.project.review.service;

import com.universestay.project.review.dto.RoomReviewDto;
import java.util.List;
import java.util.Map;

public interface RoomReviewService {

    List<RoomReviewDto> getRoomReviewList(String room_id) throws Exception;

//    int write(RoomReviewDto roomReviewDto) throws Exception;

    List<Map<String, Object>> getUserReviewList(String user_id) throws Exception;

}
