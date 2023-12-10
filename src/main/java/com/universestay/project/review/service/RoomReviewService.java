package com.universestay.project.review.service;

import com.universestay.project.review.dto.RoomReviewDto;
import java.util.List;

public interface RoomReviewService {

    List<RoomReviewDto> getRoomReviewList(String room_id) throws Exception;

}
