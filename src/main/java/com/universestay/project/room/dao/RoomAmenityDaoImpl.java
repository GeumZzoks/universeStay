package com.universestay.project.room.dao;

import com.universestay.project.room.dto.RoomAmenityDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomAmenityDaoImpl implements RoomAmenityDao {

    private final SqlSession session;
    private final String namespace = "com.universestay.project.resources.mybatis.mapper.room.roomAmenityMapper.";

    @Autowired
    public RoomAmenityDaoImpl(SqlSession session) {
        this.session = session;
    }

    @Override
    public Integer saveRoomAmenityDto(RoomAmenityDto roomAmenityDto) throws Exception {
        return session.insert(namespace + "saveRoomAmenityDto", roomAmenityDto);
    }

    @Override
    public RoomAmenityDto lookUpRoomAmenity(String room_id) throws Exception {
        return session.selectOne(namespace + "lookUpRoomAmenity", room_id);
    }

    @Override
    public RoomAmenityDto selectRoomAmenity(String room_id) throws Exception {
        return session.selectOne(namespace + "selectRoomAmenity", room_id);
    }

    @Override
    public Integer updateRoomAmenity(RoomAmenityDto roomAmenityDto) throws Exception {
        return session.update(namespace + "updateRoomAmenity", roomAmenityDto);
    }


}
