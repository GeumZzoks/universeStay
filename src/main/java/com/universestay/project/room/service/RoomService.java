package com.universestay.project.room.service;

import com.universestay.project.common.SearchCondition;
import com.universestay.project.room.dto.RoomAmenityDto;
import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;
import com.universestay.project.room.dto.RoomManagementDto;
import com.universestay.project.room.dto.RoomPhotoDto;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

public interface RoomService {

    int countAllRoom(SearchCondition sc) throws Exception;

    List<Map<String, Object>> lookUpAllRoom(SearchCondition sc) throws Exception;

    Map<String, Object> lookUpRoom(String room_id, String user_id) throws Exception;

    List<RoomImgDto> lookUp5RoomImg(String room_id) throws Exception;

    List<RoomManagementDto> listHostRoom(String user_id) throws Exception;
//    List<Map<String, Object>> listHostRoom(String user_id) throws Exception;

    Integer statusHostroom(String room_id, String room_status_id) throws Exception;

    String enroll(RoomDto roomDto, RoomAmenityDto roomAmenityDto, Integer room_view,
            HttpSession session) throws Exception;

    Integer enrollPhoto(RoomPhotoDto roomPhotoDto, String room_id, String host_id) throws Exception;

    RoomDto readRoom(String room_id) throws Exception;
}
