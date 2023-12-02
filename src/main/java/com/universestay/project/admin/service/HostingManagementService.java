package com.universestay.project.admin.service;

import com.universestay.project.dto.RoomDto;
import java.util.List;

public interface HostingManagementService {

    List<RoomDto> list() throws Exception;

    List<RoomDto> searchRoomList(String status_id, String room_name) throws Exception;

    Integer updateRoomStatus(String status_id, String[] room_id_arr) throws Exception;

}
