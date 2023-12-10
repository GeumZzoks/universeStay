package com.universestay.project.room.service;

import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;
import java.util.List;

public interface RoomService {

    List<RoomDto> lookUpAllRoom() throws Exception;

    RoomDto lookUpRoom(String room_id) throws Exception;

    List<RoomImgDto> lookUp5RoomImg(String room_id) throws Exception;

    List<RoomDto> listHostRoom(String user_id) throws Exception;
//    List<Map<String, Object>> listHostRoom(String user_id) throws Exception;

    Integer statusHostroom(String room_id, String room_status_id) throws Exception;
}
