package com.universestay.project.room.dao;

import com.universestay.project.room.dto.RoomDto;
import java.util.List;

public interface RoomDao {

    List<RoomDto> selectAll() throws Exception;

    RoomDto select(String room_id) throws Exception;

}
