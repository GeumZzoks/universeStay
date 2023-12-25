package com.universestay.project.room.service;

import com.universestay.project.room.dao.RoomViewDao;
import com.universestay.project.room.dto.RoomViewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomViewServiceImpl implements RoomViewService {

    @Autowired
    RoomViewDao roomViewDao;


    @Override
    public Integer removeRoomView(String room_id) throws Exception {
        return roomViewDao.deleteRoomView(room_id);
    }

    @Override
    public Integer saveRoomView(RoomViewDto roomViewDto) throws Exception {
        return roomViewDao.saveRoomView(roomViewDto);
    }
}
