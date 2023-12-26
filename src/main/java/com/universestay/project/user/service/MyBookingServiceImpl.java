package com.universestay.project.user.service;

import com.universestay.project.review.dto.RoomReviewDto;
import com.universestay.project.user.dao.MyBookingDao;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyBookingServiceImpl implements MyBookingService {

    @Autowired
    MyBookingDao myBookingDao;

    @Override
    public List<Map<String, Object>> getMyBookingList(Map map) throws Exception {
        return myBookingDao.selectMyBookings(map);
    }

    @Override
    public int writeRoomReview(RoomReviewDto dto) throws Exception {
        return myBookingDao.insertRoomReview(dto);
    }

    @Override
    public int updateReviewStatus(String booking_id) throws Exception {
        return myBookingDao.updateReviewStatus(booking_id);
    }

    @Override
    public int updateBookingStatus() throws Exception {
        return myBookingDao.updateBookingStatus();
    }

    @Override
    public int updateRoomStarAvg(String room_id) throws Exception {
        return myBookingDao.updateRoomStarAvg(room_id);
    }
}
