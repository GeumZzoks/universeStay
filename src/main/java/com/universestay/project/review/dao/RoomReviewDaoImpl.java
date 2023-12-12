package com.universestay.project.review.dao;

import com.universestay.project.review.dto.RoomReviewDto;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomReviewDaoImpl implements RoomReviewDao {

    @Autowired
    SqlSession session;

    private static String namespace = "com.universestay.project.review.dao.RoomReviewDao.";

    @Override
    public List<RoomReviewDto> roomReviewSelectAll(String room_id) throws Exception {
        return session.selectList(namespace + "roomReviewSelectAll", room_id);
    }

//    @Override
//    public int insert(RoomReviewDto roomReviewDto) throws Exception {
//        return session.insert(namespace + "insert", roomReviewDto);
//    }

    @Override
    public List<Map<String, Object>> userReviewSelectAll(String user_id) throws Exception {
        return session.selectList(namespace + "userReviewSelectAll", user_id);
    }

}
