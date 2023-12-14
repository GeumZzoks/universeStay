package com.universestay.project.room.dao;

import com.universestay.project.common.exception.CommonException;
import com.universestay.project.dto.BookingDto;
import java.util.Map;

public interface BookDao {

    Map<String, Object> selectRoomBookInfo(String room_id) throws CommonException;

    Integer bookRoom(BookingDto bookingDto) throws CommonException;

    Integer selectCheckBookingRoom(BookingDto bookingDto)
            throws CommonException;
}
