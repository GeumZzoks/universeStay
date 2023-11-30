package com.universestay.project.admin.dao;

import com.universestay.project.dto.RoomDto;
import java.util.List;

public interface HostingManagementDao {

    List<RoomDto> selectAll() throws Exception;
}
