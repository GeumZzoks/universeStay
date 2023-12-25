package com.universestay.project.review.service;

import java.util.List;
import java.util.Map;

public interface RoomReviewService {

    List<Map<String, Object>> getRoomReviewList(String room_id) throws Exception;

    List<Map<String, Object>> getUserReviewList(String user_id) throws Exception;

    int getRoomReviewCount(String room_id) throws Exception;

    Double getRoomReviewAvg(String room_id) throws Exception;

    List<Map<String, Object>> getRoomReviewSix(String room_id) throws Exception;

}
