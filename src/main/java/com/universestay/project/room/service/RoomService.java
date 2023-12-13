package com.universestay.project.room.service;

import com.universestay.project.room.dto.RoomAmenityDto;
import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

public interface RoomService {

    List<Map<String, Object>> lookUpAllRoom(String user_id) throws Exception;

    Map<String, Object> lookUpRoom(String room_id, String user_id) throws Exception;

    List<RoomImgDto> lookUp5RoomImg(String room_id) throws Exception;

    List<RoomDto> listHostRoom(String user_id) throws Exception;
//    List<Map<String, Object>> listHostRoom(String user_id) throws Exception;

    Integer statusHostroom(String room_id, String room_status_id) throws Exception;

    List<Map<String, Object>> lookUpAllRoomByCategory(String room_category_id) throws Exception;

    List<Map<String, Object>> lookUpAllRoomByView(String view_status_id) throws Exception;

    Integer enroll(RoomDto roomDto, RoomAmenityDto roomAmenityDto, Integer room_view,
            HttpSession session);
}
