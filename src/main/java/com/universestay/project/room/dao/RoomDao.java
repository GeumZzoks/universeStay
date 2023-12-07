package com.universestay.project.room.dao;

import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;
import java.util.List;

public interface RoomDao {

    List<RoomDto> selectAll() throws Exception;

    RoomDto select(String room_id) throws Exception;

    List<RoomImgDto> select5RoomImg(String roomd_id) throws Exception;

}
