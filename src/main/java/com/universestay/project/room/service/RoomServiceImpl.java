package com.universestay.project.room.service;

import com.universestay.project.common.SearchCondition;
import com.universestay.project.room.dao.RoomAmenityDao;
import com.universestay.project.room.dao.RoomDao;
import com.universestay.project.room.dao.RoomViewDao;
import com.universestay.project.room.dto.RoomAmenityDto;
import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;
import com.universestay.project.room.dto.RoomViewDto;
import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.UserLoginService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    RoomDao roomDao;
    @Autowired
    UserLoginService userLoginService;
    @Autowired
    RoomAmenityDao roomAmenityDao;
    @Autowired
    RoomViewDao roomViewDao;

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

    @Override
    public Integer enroll(RoomDto roomDto, RoomAmenityDto roomAmenityDto, Integer room_view,
            HttpSession session) {
        try {
            String uuid = UUID.randomUUID().toString();
            roomDto.setRoom_id(uuid);
            String loginedUserEmail = (String) session.getAttribute("user_email");
            UserDto loginedUserDto = userLoginService.checkSignUp(loginedUserEmail);
            roomDto.setUser_id(loginedUserDto.getUser_id());
            roomDto.setStatus_id("RA01");
            roomDto.setRoom_status_id("R01");
            roomDto.setRoom_is_auto_aprv("N");
            roomDto.setCreated_id(loginedUserDto.getUser_id());
            roomDto.setUpdated_id(loginedUserDto.getUser_id());
            roomDao.saveRoomDto(roomDto);

            roomAmenityDto.setRoom_id(uuid);
            roomAmenityDto.setCreated_id(loginedUserDto.getUser_id());
            roomAmenityDto.setUpdated_id(loginedUserDto.getUser_id());
            roomAmenityDao.saveRoomAmenityDto(roomAmenityDto);

            String binaryString = Integer.toBinaryString(room_view);
            Map<Integer, String> viewMap = new HashMap<>();
            String[] roomViewArr = {"RV01", "RV02", "RV03", "RV04", "RV05", "RV06", "RV07", "RV08",
                    "RV09", "RV10", "RV11", "RV12", "RV13", "RV14"};
            int powNum = 0;
            for (String roomviewStr : roomViewArr) {
                viewMap.put((int) Math.pow(2, powNum++), roomviewStr);
            }
            StringBuffer sb = new StringBuffer(binaryString);
            String[] binaryArr = sb.reverse().toString().split("");
            powNum = 0;
            RoomViewDto roomViewDto = new RoomViewDto();
            roomViewDto.setRoom_id(uuid);
            roomViewDto.setCreated_id(loginedUserDto.getUser_id());
            roomViewDto.setUpdated_id(loginedUserDto.getUser_id());
            for (String binary : binaryArr) {
                if (binary.equals("1")) {
                    String roomView = viewMap.get((int) Math.pow(2, powNum));
                    String roomViewUuid = UUID.randomUUID().toString();
                    roomViewDto.setRoom_view_id(roomViewUuid);
                    roomViewDto.setView_status_id(roomView);
                    roomViewDao.saveRoomView(roomViewDto);
                }
                powNum++;
            }

            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

}
