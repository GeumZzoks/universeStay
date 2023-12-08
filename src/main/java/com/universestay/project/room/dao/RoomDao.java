package com.universestay.project.room.dao;

import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;
import java.util.List;
import java.util.Map;

public interface RoomDao {

    List<RoomDto> selectAll() throws Exception;

    RoomDto select(String room_id) throws Exception;

    List<RoomImgDto> select5RoomImg(String roomd_id) throws Exception;

    List<RoomDto> selectAllByCategory(String room_category_id) throws Exception;

    List<Map<String, Object>> selectAllByView(String view_status_id) throws Exception;
}
