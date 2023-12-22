package com.universestay.project.review.dao;

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
    public List<Map<String, Object>> roomReviewSelectAll(String room_id) throws Exception {
        return session.selectList(namespace + "roomReviewSelectAll", room_id);
    }

    @Override
    public List<Map<String, Object>> userReviewSelectAll(String user_id) throws Exception {
        return session.selectList(namespace + "userReviewSelectAll", user_id);
    }

    @Override
    public int roomReviewCount(String room_id) throws Exception {
        return session.selectOne(namespace + "roomReviewCount", room_id);
    }

    @Override
    public double roomReviewAvg(String room_id) throws Exception {
        return session.selectOne(namespace + "roomReviewAvg", room_id);
    }

    @Override
    public List<Map<String, Object>> roomReviewSelectSix(String room_id) throws Exception {
        return session.selectList(namespace + "roomReviewSelectSix", room_id);
    }

}
