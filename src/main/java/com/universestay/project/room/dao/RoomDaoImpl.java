package com.universestay.project.room.dao;

import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDaoImpl implements RoomDao {

    private final SqlSession session;
    private final String namespace = "com.universestay.project.resources.mybatis.mapper.room.roomMapper.";

    @Autowired
    public RoomDaoImpl(SqlSession session) {
        this.session = session;
    }

    @Override
    public List<Map<String, Object>> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public RoomDto select(String room_id) throws Exception {
        return session.selectOne(namespace + "select", room_id);
    }

    @Override
    public List<RoomImgDto> select5RoomImg(String room_id) throws Exception {
        return session.selectList(namespace + "select5RoomImg", room_id);
    }

    public List<RoomDto> listHostRoom(String user_id) {
        return session.selectList(namespace + "listHostRoom", user_id);
    }
    // 숙소테이블에 대표사진 컬럼을 추가 하기 전 코드
//    public List<Map<String, Object>> listHostRoom(String user_id) {
//        return session.selectList(namespace + "listHostRoom", user_id);
//    }

    @Override // 만약 DB에서 삭제 되지 않는 이슈를 고려하여 반환타입을 Integer 사용
    public Integer statusHostroom(String room_id, String room_status_id) throws Exception {
        Map<String, String> map = new HashMap<>();
        map.put("room_id", room_id);
        map.put("room_status_id", room_status_id);
        return session.update(namespace + "statusHostroom", map);
    }

    @Override
    public List<Map<String, Object>> selectAllByCategory(String room_category_id) throws Exception {
        return session.selectList(namespace + "selectAllByCategory", room_category_id);
    }

    @Override
    public List<Map<String, Object>> selectAllByView(String view_status_id) throws Exception {
        return session.selectList(namespace + "selectAllByView", view_status_id);
    }

    @Override
    public Integer saveRoomDto(RoomDto roomDto) throws Exception {
        return session.insert(namespace + "saveRoomDto", roomDto);
    }
}
