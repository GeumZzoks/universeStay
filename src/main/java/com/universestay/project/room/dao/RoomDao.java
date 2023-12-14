package com.universestay.project.room.dao;

import com.universestay.project.common.SearchCondition;
import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;
import java.util.List;
import java.util.Map;

public interface RoomDao {

    int countAll(SearchCondition sc) throws Exception;

    List<Map<String, Object>> selectAll(SearchCondition sc) throws Exception;

    Map<String, Object> select(String room_id, String user_id) throws Exception;

    List<RoomImgDto> select5RoomImg(String room_id) throws Exception;

    List<RoomDto> listHostRoom(String user_id) throws Exception;
//    List<Map<String, Object>> listHostRoom(String user_id) throws Exception;

    Integer statusHostroom(String room_id, String room_status_id) throws Exception;

    Integer saveRoomDto(RoomDto roomDto) throws Exception;
}
