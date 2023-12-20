package com.universestay.project.user.service;

import com.universestay.project.user.dao.HostBookingManagementDao;
import com.universestay.project.user.dto.BookingDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class HostBookingManagementServiceImpl implements  HostBookingManagementService{

    @Autowired
    HostBookingManagementDao hostBookingManagementDao;

    @Override
    public List<Map<String, Object>> getBookingRequestList(String user_id) throws Exception {
        return hostBookingManagementDao.selectBookingRequestList(user_id);
    }

    @Override
    public int approveBookingRequest(String booking_id) throws Exception {
        return hostBookingManagementDao.aprvBookingRequest(booking_id);
    }

    @Override
    public int rejectBookingRequest(String booking_id) throws Exception {
        return hostBookingManagementDao.rjtBookingRequest(booking_id);
    }
}
