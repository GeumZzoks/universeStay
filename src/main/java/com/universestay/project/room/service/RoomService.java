package com.universestay.project.room.service;

import com.universestay.project.room.dto.RoomDto;
import java.util.List;

public interface RoomService {

    List<RoomDto> lookUpAllRoom() throws Exception;

    RoomDto lookUpRoom(String room_id) throws Exception;
}
