package com.universestay.project.room.dao;

import com.universestay.project.room.dto.RoomAmenityDto;

public interface RoomAmenityDao {

    Integer saveRoomAmenityDto(RoomAmenityDto roomAmenityDto) throws Exception;

    RoomAmenityDto lookUpRoomAmenity(String room_id) throws Exception;

    RoomAmenityDto selectRoomAmenity(String room_id) throws Exception;

    Integer updateRoomAmenity(RoomAmenityDto roomAmenityDto) throws Exception;
}
