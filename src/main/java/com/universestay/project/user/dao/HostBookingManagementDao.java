package com.universestay.project.user.dao;

import com.universestay.project.user.dto.BookingDto;

import java.util.List;
import java.util.Map;

public interface HostBookingManagementDao {
    List<Map<String, Object>> selectBookingRequestList(String user_id) throws Exception;

    int aprvBookingRequest(String booking_id) throws Exception;

    int rjtBookingRequest(String booking_id) throws Exception;
}
