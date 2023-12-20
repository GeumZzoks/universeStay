package com.universestay.project.room.dao;

import com.universestay.project.room.dto.RoomViewDto;
import java.util.List;

public interface RoomViewDao {

    Integer saveRoomView(RoomViewDto roomViewDto) throws Exception;

    Integer deleteRoomView(String room_id) throws Exception;

    List<RoomViewDto> selectRoomView(String room_id) throws Exception;
}
