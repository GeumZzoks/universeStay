package com.universestay.project.admin.service;

import com.universestay.project.admin.dao.HostingManagementDao;
import com.universestay.project.dto.RoomDto;
import java.util.List;
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
}
