package com.universestay.project.review.service;

import com.universestay.project.review.dao.RoomReviewDao;
import com.universestay.project.review.dto.RoomReviewDto;
import java.util.List;
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
}
