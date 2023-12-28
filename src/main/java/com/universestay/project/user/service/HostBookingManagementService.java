package com.universestay.project.user.service;

import com.universestay.project.user.dto.BookingDto;

import java.util.List;
import java.util.Map;

public interface HostBookingManagementService {
    List<Map<String, Object>> getBookingRequestList(String user_id) throws Exception;
    int approveBookingRequest(String booking_id) throws Exception;
    int rejectBookingRequest(String booking_id) throws Exception;
}
