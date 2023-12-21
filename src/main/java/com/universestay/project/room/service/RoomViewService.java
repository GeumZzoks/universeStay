package com.universestay.project.room.service;

import com.universestay.project.room.dto.RoomViewDto;

public interface RoomViewService {

    Integer removeRoomView(String room_id) throws Exception;

    Integer saveRoomView(RoomViewDto roomViewDto) throws Exception;

}
