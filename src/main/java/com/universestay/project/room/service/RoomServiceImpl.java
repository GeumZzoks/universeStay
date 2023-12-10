package com.universestay.project.room.service;

import com.universestay.project.room.dao.RoomDao;
import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    RoomDao roomDao;

    @Override
    public List<Map<String, Object>> lookUpAllRoom() throws Exception {
        return roomDao.selectAll();
    }

    @Override
    public RoomDto lookUpRoom(String room_id) throws Exception {
        return roomDao.select(room_id);
    }

    @Override
    public List<RoomImgDto> lookUp5RoomImg(String room_id) throws Exception {
        return roomDao.select5RoomImg(room_id);
    }

    @Override
    public List<Map<String, Object>> lookUpAllRoomByCategory(String room_category_id)
            throws Exception {
        return roomDao.selectAllByCategory(room_category_id);
    }

    @Override
    public List<Map<String, Object>> lookUpAllRoomByView(String view_status_id) throws Exception {
        return roomDao.selectAllByView(view_status_id);
    }
}
