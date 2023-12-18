package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.HostingManagementDao;
import com.universestay.project.room.dto.RoomDto;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HostingManagementServiceImpl implements HostingManagementService {

    @Autowired
    HostingManagementDao hostingManagementDao;

    @Override
    public List<RoomDto> list() throws Exception {
        return hostingManagementDao.selectAll();
    }

    @Override
    public List<RoomDto> searchRoomList(String status_id, String room_name) throws Exception {
        Map<String, String> map = new HashMap<>();
        map.put("status_id", status_id);
        map.put("room_name", room_name);
        return hostingManagementDao.searchList(map);
    }

    @Override
    public Integer updateRoomStatus(String status_id, String[] room_id_arr) throws Exception {

        System.out.println("status_id = " + status_id);

        status_id = (status_id.equals("승인 완료")) ? "RA02" : "RA03";

        List<String> roomIdsList = Arrays.asList(room_id_arr);
        System.out.println("roomIdsList = " + roomIdsList);

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("status_id", status_id);
        paramMap.put("roomIdsList", roomIdsList);

        return hostingManagementDao.updateAll(paramMap);
    }
}
