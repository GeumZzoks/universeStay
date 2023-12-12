package com.universestay.project.review.service;

import com.universestay.project.review.dao.RoomReviewDao;
import com.universestay.project.review.dto.RoomReviewDto;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomReviewServiceImpl implements RoomReviewService {

    @Autowired
    RoomReviewDao roomReviewDao;

    @Override
    public List<RoomReviewDto> getRoomReviewList(String room_id) throws Exception {
        return roomReviewDao.roomReviewSelectAll(room_id);
    }

//    @Override
//    public int write(RoomReviewDto roomReviewDto) throws Exception {
//        return roomReviewDao.insert(roomReviewDto);
//    }

    @Override
    public List<Map<String, Object>> getUserReviewList(String user_id) throws Exception {
        return roomReviewDao.userReviewSelectAll(user_id);
    }

}
