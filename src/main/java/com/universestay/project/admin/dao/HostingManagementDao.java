package com.universestay.project.admin.dao;

import com.universestay.project.room.dto.RoomDto;
import java.util.List;
import java.util.Map;

public interface HostingManagementDao {

    List<RoomDto> selectAll() throws Exception;

    List<RoomDto> searchList(Map<String, String> map) throws Exception;

    Integer updateAll(Map<String, Object> paramMap) throws Exception;
}
