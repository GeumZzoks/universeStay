package com.universestay.project.room.service;

import com.universestay.project.common.exception.CommonException;
import com.universestay.project.user.dto.BookingDto;
import java.util.Map;
import javax.servlet.http.HttpSession;

public interface BookService {

    Map<String, Object> selectRoomBookInfo(String room_id) throws CommonException;

    Integer bookRoom(BookingDto bookingDto, Map<String, Object> roomDto, HttpSession httpSession)
            throws CommonException;

    Integer selectCheckBookingRoom(BookingDto bookingDto)
            throws CommonException;

    Integer updateStatus(String booking_id) throws CommonException;
}
