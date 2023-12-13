package com.universestay.project.room.service;

import com.universestay.project.common.SearchCondition;
import com.universestay.project.room.dao.RoomDao;
import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    RoomDao roomDao;

    @Override

    public int countAllRoom(SearchCondition sc) throws Exception {
        return roomDao.countAll(sc);
    }

    @Override
    public List<Map<String, Object>> lookUpAllRoom(SearchCondition sc) throws Exception {
        return roomDao.selectAll(sc);
    }

    @Override
    public Map<String, Object> lookUpRoom(String room_id, String user_id) throws Exception {
        return roomDao.select(room_id, user_id);
    }

    @Override
    public List<RoomImgDto> lookUp5RoomImg(String room_id) throws Exception {
        return roomDao.select5RoomImg(room_id);
    }

    public List<RoomDto> listHostRoom(String user_id) throws Exception {
        return roomDao.listHostRoom(user_id);
    }
    // 숙소테이블에 대표사진 컬럼을 추가 하기 전 코드
//    public List<Map<String, Object>> listHostRoom(String user_id) throws Exception {
//        return roomDao.listHostRoom(user_id);
//    }

    @Override
    public Integer statusHostroom(String room_id, String room_status_id) throws Exception {
        return roomDao.statusHostroom(room_id, room_status_id);
    }

}
