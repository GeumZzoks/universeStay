package com.universestay.project.room.dao;

import com.universestay.project.common.exception.CommonException;
import com.universestay.project.user.dto.BookingDto;
import com.universestay.project.user.dto.UserDto;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookDaoImpl implements BookDao {

    private final SqlSession session;
    private final String namespace = "com.universestay.project.resources.mybatis.mapper.room.bookRoomMapper.";

    @Autowired
    public BookDaoImpl(SqlSession session) {
        this.session = session;
    }

    @Override
    public Map<String, Object> selectRoomBookInfo(String room_id) throws CommonException {
        return session.selectOne(namespace + "selectRoomBookInfo", room_id);
    }

    @Override
    public Integer bookRoom(BookingDto bookingDto) throws CommonException {
        return session.insert(namespace + "bookRoom", bookingDto);
    }

    @Override
    public Integer selectCheckBookingRoom(BookingDto bookingDto)
            throws CommonException {
        return session.selectOne(namespace + "selectCheckBookingRoom", bookingDto);
    }

    @Override
    public List<BookingDto> selectUnavailableDates(String room_id) throws Exception {
        return session.selectList(namespace + "selectUnavailableDates", room_id);
    }

    @Override
    public UserDto getUserInfo(String userEmail) throws CommonException {
        return session.selectOne(namespace + "selectUserInfo", userEmail);
    }

    @Override
    public Integer updateStatus(String bookingId) throws CommonException {
        return session.update(namespace + "updateStatus", bookingId);
    }
}
