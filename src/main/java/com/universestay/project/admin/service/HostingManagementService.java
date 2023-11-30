package com.universestay.project.admin.service;

import com.universestay.project.dto.RoomDto;
import java.util.List;

public interface HostingManagementService {

    List<RoomDto> list() throws Exception;

}
