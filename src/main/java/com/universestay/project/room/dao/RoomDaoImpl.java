package com.universestay.project.room.dao;

import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDaoImpl implements RoomDao {

    private final SqlSession session;
    private final String namespace = "com.universestay.project.resources.mybatis.mapper.room.roomMapper.";

    @Autowired
    public RoomDaoImpl(SqlSession session) {
        this.session = session;
    }

    @Override
    public List<RoomDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public RoomDto select(String room_id) throws Exception {
        return session.selectOne(namespace + "select", room_id);
    }

    @Override
    public List<RoomImgDto> select5RoomImg(String room_id) throws Exception {
        return session.selectList(namespace + "select5RoomImg", room_id);
    }

    @Override
    public List<RoomDto> selectAllByCategory(String room_category_id) throws Exception {
        return session.selectList(namespace + "selectAllByCategory", room_category_id);
    }
}
