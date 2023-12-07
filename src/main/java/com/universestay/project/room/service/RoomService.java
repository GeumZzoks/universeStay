package com.universestay.project.room.service;

import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;
import java.util.List;

public interface RoomService {

    List<RoomDto> lookUpAllRoom() throws Exception;

    RoomDto lookUpRoom(String room_id) throws Exception;

    List<RoomImgDto> lookUp5RoomImg(String room_id) throws Exception;

    List<RoomDto> lookUpAllRoomByCategory(String room_category_id) throws Exception;

}
