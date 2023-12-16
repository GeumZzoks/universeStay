package com.universestay.project.room.controller;

import com.universestay.project.room.dto.RoomAmenityDto;
import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;
import com.universestay.project.room.service.RoomAmenityService;
import com.universestay.project.room.service.RoomService;
import com.universestay.project.user.dao.UserWithdrawalDao;
import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.ProfileImgServiceImpl;
import com.universestay.project.user.service.UserInfoService;
import com.universestay.project.user.service.UserLoginService;
import com.universestay.project.user.service.WishListService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/room")
public class RoomController {

    @Autowired
    RoomService roomService;
    @Autowired
    UserLoginService userLoginService;
    @Autowired
    UserWithdrawalDao userWithdrawalDao;
    @Autowired
    ProfileImgServiceImpl profileImgService;
    @Autowired
    RoomAmenityService roomAmenityService;

    @Autowired
    UserInfoService userInfoService;
    @Autowired
    WishListService wishListService;

    @GetMapping("")
    public String showRoom() {
        return "/room/roomDetail_copy";
    }

    @GetMapping("/{room_id}")
    public String lookUpRoom(@PathVariable String room_id, Model model, HttpSession session) {
        try {
            String user_email = (String) session.getAttribute("user_email");
            String user_id = wishListService.getUserUuid(user_email);

            Map<String, Object> room = roomService.lookUpRoom(room_id, user_id);
            List<RoomImgDto> roomImgs = roomService.lookUp5RoomImg(room_id);
            List<String[]> roomAmenities = roomAmenityService.lookUpRoomAmenity(room_id);
            UserDto host = userWithdrawalDao.selectUserByUuid(user_id);
            String profileImgUrl = profileImgService.getProfileImgUrl(user_id);

            if (room == null) {
                // TODO: 에러메세지 보여주고 메인으로 이동
                return "main/main";
            }

            model.addAttribute("room", room);
            model.addAttribute("roomImgList", roomImgs);
            model.addAttribute("host", host);
            model.addAttribute("profileImgUrl", profileImgUrl);
            model.addAttribute("roomAmenities", roomAmenities);
//            for (String[] roomAmenity : roomAmenities) {
//                System.out.println("roomAmenity[0] = " + roomAmenity[0]);
//                System.out.println("roomAmenity[1] = " + roomAmenity[1]);
//            }

            return "room/roomDetail";
        } catch (Exception e) {
            e.printStackTrace();
            // TODO: 에러메세지 보여주고 메인으로 이동
            return "main/main";
        }
    }

    /**
     * @param session
     * @param model
     * @return
     * @throws Exception
     * @feat 호스트 숙소 목록
     */
    @GetMapping("/management")
    public String roomManagement(HttpSession session, Model model) throws Exception {

        try {
            // 로그인한 유저의 정보를 세션에서 얻어온다.
            String loginedUserEmail = (String) session.getAttribute("user_email");

            // '호스트가 등록한' 숙소리스트를 불러오기 위해 숙소테이블 조회에 필요한 조건을 userDto에서 얻어온다.
            UserDto userDto = userLoginService.checkSignUp(loginedUserEmail);
            String userId = userDto.getUser_id();

            // 숙소목록을 조회한 후 모델에 담는다.
            // 룸상태가 R03(숙소폐점)인 숙소는 제외 한다.
            List<RoomDto> roomDtoList = roomService.listHostRoom(userId);

            model.addAttribute("roomDtoList", roomDtoList);

            // 숙소테이블에 대표사진 컬럼을 추가 하기 전 코드
//            List<Map<String, Object>> roomDtoList = roomService.listHostRoom(userId);
//            System.out.println("roomDtoList = " + roomDtoList);

            return "/room/management";

        } catch (Exception e) {
            e.printStackTrace();
            return "/room/management";
        }
    }

    @GetMapping("/enroll")
    public String enrollRoom() {
        return "/room/roomEnroll";
    }

    @PostMapping("/enroll")
    public String enrollRoom(RoomDto roomDto, RoomAmenityDto roomAmenityDto, Integer room_view,
            HttpSession session) {

        System.out.println("roomDto = " + roomDto);
        System.out.println("roomAmenityDto = " + roomAmenityDto);
        System.out.println("room_view = " + room_view);

        roomService.enroll(roomDto, roomAmenityDto, room_view, session);
        return "redirect:/room/management";
    }

    /**
     * @param room_id
     * @param room_status_id
     * @return
     * @throws Exception
     * @feature 호스트룸 활성 상태 변경
     */
    @GetMapping("/statusHostroom")
    public String statusHostroom(@RequestParam String room_id,
            @RequestParam(defaultValue = "") String room_status_id) throws Exception {
        try {
            System.out.println("room_id = " + room_id);
            System.out.println("스테이터스호스트룸 컨트롤러 ");
            roomService.statusHostroom(room_id, room_status_id);
            return "redirect:/room/management";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/room/management";
        }
    }
}
