package com.universestay.project.room.controller;

import com.universestay.project.room.dao.RoomViewDao;
import com.universestay.project.room.dao.BookDao;
import com.universestay.project.room.dto.RoomAmenityDto;
import com.universestay.project.room.dto.RoomDto;
import com.universestay.project.room.dto.RoomImgDto;
import com.universestay.project.room.dto.RoomManagementDto;
import com.universestay.project.room.dto.RoomPhotoDto;
import com.universestay.project.room.dto.RoomViewDto;
import com.universestay.project.room.service.RoomAmenityService;
import com.universestay.project.room.service.RoomService;
import com.universestay.project.user.dao.UserWithdrawalDao;
import com.universestay.project.user.dto.BookingDto;
import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.ProfileImgServiceImpl;
import com.universestay.project.user.service.UserInfoService;
import com.universestay.project.user.service.UserLoginService;
import com.universestay.project.user.service.WishListService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
    @Autowired
    RoomViewDao roomViewDao;
    @Autowired
    BookDao bookDao;


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
            UserDto host = userWithdrawalDao.selectUserByUuid((String) room.get("user_id"));
            String profileImgUrl = profileImgService.getProfileImgUrl((String) room.get("user_id"));
            List<BookingDto> bookingDtos = bookDao.selectUnavailableDates(room_id);

            if (room == null) {
                // TODO: 에러메세지 보여주고 메인으로 이동
                return "redirect:/";
            }

            List<RoomImgDto> roomImgList = new ArrayList<>();
            for (RoomImgDto roomImg : roomImgs) {
                if (roomImg.getRoom_img_url().equals(room.get("room_main_photo"))) {
                    continue;
                }
                roomImgList.add(roomImg);
            }

            model.addAttribute("room", room);
            model.addAttribute("roomImgList", roomImgList);
            model.addAttribute("host", host);
            model.addAttribute("profileImgUrl", profileImgUrl);
            model.addAttribute("roomAmenities", roomAmenities);
            model.addAttribute("bookingDtos", bookingDtos);

            return "room/roomDetail";

        } catch (Exception e) {
            e.printStackTrace();
            // TODO: 에러메세지 보여주고 메인으로 이동
            return "redirect:/";
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
            List<RoomManagementDto> roomManagementDtoList = roomService.listHostRoom(userId);
//            System.out.println("roomManagementDtoList = " + roomManagementDtoList);

            model.addAttribute("roomManagementDtoList", roomManagementDtoList);
            // 숙소테이블에 대표사진 컬럼을 추가 하기 전 코드
//            List<Map<String, Object>> roomDtoList = roomService.listHostRoom(userId);
//            System.out.println("roomDtoList = " + roomDtoList);

            // 헤더에 프로필이미지/토글
            String profileImgUrl = profileImgService.getProfileImgUrl(userDto.getUser_id());
            String isHost = userDto.getUser_is_host();
            model.addAttribute("userInfo", userDto);
            model.addAttribute("profileImgUrl", profileImgUrl);
            model.addAttribute("isHost", isHost);

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
                             HttpSession session, RedirectAttributes redirectAttributes) {
        try {
            String room_id = roomService.enroll(roomDto, roomAmenityDto, room_view, session);
            redirectAttributes.addAttribute("room_id", room_id);
        } catch (Exception e) {
            e.printStackTrace();
            // TODO : 에러처리
        }
        return "redirect:/room/photoEnroll";
    }

    @GetMapping("/photoEnroll")
    public String enrollRoomPhoto(String room_id, Model model) {
        model.addAttribute("room_id", room_id);
        return "/room/roomPhotoEnroll";
    }

    @PostMapping("/photoEnroll")
    public String enrollRoomPhoto(RoomPhotoDto roomPhotoDto, String room_id, HttpSession session) {
        try {
            String host_id = (String) session.getAttribute("user_id");
            System.out.println("host_id = " + host_id);
            System.out.println("roomPhotoDto = " + roomPhotoDto);
            System.out.println("room_id = " + room_id);
            roomService.enrollPhoto(roomPhotoDto, room_id, host_id);
        } catch (Exception e) {
            e.printStackTrace();
            // TODO : 에러처리
        }
        return "redirect:/room/management";
    }

    /**
     * @param room_id
     * @param model
     * @return
     * @throws Exception
     * @feat 모달창 숙소 수정하기 맵핑
     */
    @GetMapping("/modify")
    public String modifyRoom(@RequestParam String room_id, Model model, HttpSession session)
            throws Exception {
//        System.out.println("room_id 컨트롤러 = " + room_id);
        // 수정하기 위해서는 디비에 저장되어 있는 숙소를 불러온 후 뷰에 담는다.
        RoomDto roomDto = roomService.readRoom(room_id);
        model.addAttribute("roomDto", roomDto);

        // roomDto에 있는 카테고리 아이디로(R03) status_name을 얻어와야 하는데
        // 디비에 들리지 않고 맵에 담아 값을 가져오는 방법이 더 간단하고, 비용을 절감할수 있대.
        Map<String, String> map = new HashMap<>();
        map.put("RC01", "아파트");
        map.put("RC02", "주택");
        map.put("RC03", "별채");
        map.put("RC04", "호텔");
        map.put("RC05", "모텔");
        map.put("RC06", "펜션");
        map.put("RC07", "콘도");
        map.put("RC08", "레지던스");
        map.put("RC09", "오피스텔");
        map.put("RC10", "한옥");
        map.put("RC11", "캠핑장/아웃도어");
        map.put("RC12", "호스텔");
        map.put("RC13", "리조트");
        // 글서 숙소 카테고리를 전부 맵에 담고, 파라미터로 받아온 값을 이용해 맵에서 카테고리네임을 찾은 후 모델에 추가한다.
        String roomCategoryName = map.get(roomDto.getRoom_category_id());
        model.addAttribute("roomCategoryName", roomCategoryName);

        // 수정하기 위해 룸어메니티 테이블도 조회해온다.
        RoomAmenityDto roomAmenityDto = roomAmenityService.readRoomAmenity(room_id);
        model.addAttribute("roomAmenityDto", roomAmenityDto);

        // 수정하기 위해 룸뷰 테이블도 조회해온다.
        List<RoomViewDto> roomViewDtoList = roomViewDao.selectRoomView(room_id);
        System.out.println("roomViewDto = " + roomViewDtoList);
        model.addAttribute("roomViewDtoList", roomViewDtoList);

        String loginedUserEmail = (String) session.getAttribute("user_email");

        // 헤더에 프로필이미지/토글 불러오기 위해 필요한 코드 => managementController와 중복되는 코드
        UserDto userDto = userLoginService.checkSignUp(loginedUserEmail);
        String userId = userDto.getUser_id();
        String profileImgUrl = profileImgService.getProfileImgUrl(userDto.getUser_id());
        String isHost = userDto.getUser_is_host();
        model.addAttribute("userInfo", userDto);
        model.addAttribute("profileImgUrl", profileImgUrl);
        model.addAttribute("isHost", isHost);

        return "/room/modify";


    }


    /**
     * @return
     * @featuer 수정완료 후 맵핑
     */
    @PostMapping("/modify")
    public String modify() {

        // 수정한 값을 가지고 디비에 저장시킨 후에
        // 저장된 값을 가지고 가야지.
        return "redirect:/room/management";
    }

    /**
     * @param room_id
     * @param room_status_id
     * @return
     * @throws Exception
     * @feature 모달창에서 호스트룸 활성 상태 변경 시 맵핑 경로
     */
    @GetMapping("/statusHostroom")
    public String statusHostroom(@RequestParam String room_id,
                                 @RequestParam(defaultValue = "") String room_status_id) throws Exception {
        try {
            roomService.statusHostroom(room_id, room_status_id);
            return "redirect:/room/management";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/room/management";
        }
    }
}