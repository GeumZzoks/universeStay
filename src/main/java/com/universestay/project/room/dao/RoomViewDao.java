package com.universestay.project.room.dao;

import com.universestay.project.room.dto.RoomViewDto;

public interface RoomViewDao {

    Integer saveRoomView(RoomViewDto roomViewDto) throws Exception;
}
