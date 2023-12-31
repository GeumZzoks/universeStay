package com.universestay.project.room.dao;

import com.universestay.project.common.SearchCondition;
import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;
import com.universestay.project.room.dto.RoomManagementDto;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDaoImpl implements RoomDao {

    private final SqlSession session;
    private final String namespace = "com.universestay.project.resources.mybatis.mapper.room.roomMapper.";


    @Override
    public int countAll(SearchCondition sc) throws Exception {
        return session.selectOne(namespace + "totalCount", sc);
    }

    @Autowired
    public RoomDaoImpl(SqlSession session) {
        this.session = session;
    }


    public List<Map<String, Object>> selectAll(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "selectAll", sc);
    }

    @Override
    public Map<String, Object> select(String room_id, String user_id) throws Exception {
        Map map = new HashMap();
        map.put("user_id", user_id);
        map.put("room_id", room_id);
        return session.selectOne(namespace + "select", map);
    }

    @Override
    public List<RoomImgDto> select5RoomImg(String room_id) throws Exception {
        return session.selectList(namespace + "select5RoomImg", room_id);
    }

    public List<RoomManagementDto> listHostRoom(String user_id) {
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
    public Integer saveRoomDto(RoomDto roomDto) throws Exception {
        return session.insert(namespace + "saveRoomDto", roomDto);
    }

    @Override
    public Integer saveRoomPhoto(String imgUrl, String room_id, String host_id) throws Exception {
        String room_photo_id = UUID.randomUUID().toString();
        Map<String, String> map = Map.of("room_photo_id", room_photo_id, "room_id", room_id,
                "imgUrl", imgUrl, "host_id", host_id);
        return session.insert(namespace + "insertRoomImg", map);
    }

    @Override
    public Integer saveRoomMainPhoto(String room_id, String imgUrl) throws Exception {
        Map<String, String> map = Map.of("room_id", room_id, "imgUrl", imgUrl);
        return session.update(namespace + "saveRoomMainPhoto", map);
    }

    @Override
    public RoomDto selectHostRoom(String room_id) throws Exception {
        return session.selectOne(namespace + "selectHostRoom", room_id);
    }

    public Integer updateHostRoom(RoomDto roomDto) throws Exception {
        return session.update(namespace + "updateHostRoom", roomDto);
    }
}
