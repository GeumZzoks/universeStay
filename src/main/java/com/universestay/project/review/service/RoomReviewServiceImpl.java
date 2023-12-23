package com.universestay.project.review.service;

import com.universestay.project.review.dao.RoomReviewDao;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomReviewServiceImpl implements RoomReviewService {

    @Autowired
    RoomReviewDao roomReviewDao;

    @Override
    public List<Map<String, Object>> getRoomReviewList(String room_id) throws Exception {
        return roomReviewDao.roomReviewSelectAll(room_id);
    }

    @Override
    public List<Map<String, Object>> getUserReviewList(String user_id) throws Exception {
        return roomReviewDao.userReviewSelectAll(user_id);
    }

    @Override
    public int getRoomReviewCount(String room_id) throws Exception {
        return roomReviewDao.roomReviewCount(room_id);
    }

    @Override
    public Double getRoomReviewAvg(String room_id) throws Exception {
        return roomReviewDao.roomReviewAvg(room_id);
    }

    @Override
    public List<Map<String, Object>> getRoomReviewSix(String room_id) throws Exception {
        return roomReviewDao.roomReviewSelectSix(room_id);
    }

}
