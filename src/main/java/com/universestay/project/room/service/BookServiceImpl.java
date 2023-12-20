package com.universestay.project.room.service;

import com.universestay.project.common.exception.CommonException;
import com.universestay.project.room.dao.BookDao;
import com.universestay.project.user.dto.BookingDto;
import com.universestay.project.user.dto.UserDto;
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
    public Integer bookRoom(BookingDto bookingDto, Map<String, Object> roomDto,
            HttpSession httpSession)
            throws CommonException {

        // Setter - BookingDTO
        UserDto User = bookDao.getUserInfo((String) httpSession.getAttribute("user_email"));
        bookingDto.setUser_id(User.getUser_id());

        String uuid = UUID.randomUUID().toString();
        bookingDto.setBooking_id(uuid);
        bookingDto.setCreated_id(uuid);
        bookingDto.setUpdated_id(uuid);

        String roomCheckinTime =
                bookingDto.getBooking_checkin_date() + " " + roomDto.get("room_checkin_time");
        String roomCheckoutTime =
                bookingDto.getBooking_checkout_date() + " " + roomDto.get("room_checkout_time");

        bookingDto.setBooking_checkin_time(roomCheckinTime);
        bookingDto.setBooking_checkout_time(roomCheckoutTime);

        return bookDao.bookRoom(bookingDto);
    }

    @Override
    public Integer selectCheckBookingRoom(BookingDto bookingDto) throws CommonException {
        return bookDao.selectCheckBookingRoom(bookingDto);
    }
}
