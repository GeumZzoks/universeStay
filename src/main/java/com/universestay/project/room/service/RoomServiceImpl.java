package com.universestay.project.room.service;

import com.universestay.project.room.dao.RoomDao;
import com.universestay.project.room.dto.RoomDto;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    RoomDao roomDao;

    @Override
    public List<RoomDto> lookUpAllRoom() throws Exception {
        return roomDao.selectAll();
    }

    @Override
    public RoomDto lookUpRoom(String room_id) throws Exception {
        return roomDao.select(room_id);
    }
}
