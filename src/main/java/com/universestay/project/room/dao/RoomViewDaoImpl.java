package com.universestay.project.room.dao;

import com.universestay.project.room.dto.RoomViewDto;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomViewDaoImpl implements RoomViewDao {

    private final SqlSession session;
    private final String namespace = "com.universestay.project.resources.mybatis.mapper.room.roomViewMapper.";

    @Autowired
    public RoomViewDaoImpl(SqlSession session) {
        this.session = session;
    }

    @Override
    public Integer saveRoomView(RoomViewDto roomViewDto) throws Exception {
        return session.insert(namespace + "saveRoomView", roomViewDto);
    }

    public Integer deleteRoomView(String room_id) throws Exception {
        return session.delete(namespace + "deleteRoomView", room_id);
    }

    @Override
    public List<RoomViewDto> selectRoomView(String room_id) throws Exception {
        return session.selectList(namespace + "selectRoomView", room_id);
    }


}
