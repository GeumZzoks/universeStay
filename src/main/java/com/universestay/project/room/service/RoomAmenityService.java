package com.universestay.project.room.service;

import com.universestay.project.room.dto.RoomAmenityDto;
import java.util.List;

public interface RoomAmenityService {

    List<String[]> lookUpRoomAmenity(String room_id) throws Exception;

    RoomAmenityDto readRoomAmenity(String room_id) throws Exception;

    Integer modifyRoomAmenity(RoomAmenityDto roomAmenityDto) throws Exception;
}
