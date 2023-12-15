package com.universestay.project.user.dao;

import com.universestay.project.review.dto.RoomReviewDto;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyBookingDaoImpl implements MyBookingDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.universestay.project.resources.mybatis.mapper.user.myBookingsMapper.";

    @Override
    public List<Map<String, Object>> selectMyBookings(Map map) throws Exception {
        return session.selectList(namespace + "selectMyBookings", map);
    }

    @Override
    public int insertRoomReview(RoomReviewDto dto) throws Exception {
        return session.insert(namespace + "insertReview", dto);
    }

}
