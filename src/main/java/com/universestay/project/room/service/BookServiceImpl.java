package com.universestay.project.room.service;

import com.universestay.project.common.exception.CommonException;
import com.universestay.project.dto.BookingDto;
import com.universestay.project.room.dao.BookDao;
import com.universestay.project.room.dto.RoomDto;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookServiceImpl implements BookService {

    private BookDao bookDao;

    @Autowired
    public BookServiceImpl(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Override
    public Map<String, Object> selectRoomBookInfo(String room_id) throws CommonException {
        return bookDao.selectRoomBookInfo(room_id);
    }

    @Override
    public Integer bookRoom(BookingDto bookingDto, RoomDto roomDto, HttpSession httpSession)
            throws CommonException {
        bookingDto.setUser_id((String) httpSession.getAttribute("user_email"));

        String uuid = UUID.randomUUID().toString();
        bookingDto.setBooking_id(uuid);
        bookingDto.setCreated_id(uuid);
        bookingDto.setUpdated_id(uuid);

        String roomCheckinTime = roomDto.getRoom_checkin_time();

//        bookingDto.setBooking_checkin_time(roomDto.getRoom_checkin_time());
//        bookingDto.setBooking_checkout_time(roomDto.getRoom_checkout_time());

        bookingDto.setBooking_checkin_time("2023-12-08 15:00:00");
        bookingDto.setBooking_checkout_time("2023-12-08 15:00:00");

        return bookDao.bookRoom(bookingDto);
    }

    @Override
    public Integer selectCheckBookingRoom(BookingDto bookingDto) throws CommonException {
        return bookDao.selectCheckBookingRoom(bookingDto);
    }
}
