package com.universestay.project.room.service;

import java.util.List;

public interface RoomAmenityService {

    List<String[]> lookUpRoomAmenity(String room_id) throws Exception;
}
