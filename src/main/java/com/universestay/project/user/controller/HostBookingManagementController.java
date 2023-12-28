package com.universestay.project.user.controller;

import com.universestay.project.room.dto.RoomManagementDto;
import com.universestay.project.room.service.RoomService;
import com.universestay.project.user.dto.UserDto;
import com.universestay.project.user.service.HostBookingManagementService;
import com.universestay.project.user.service.ProfileImgService;
import com.universestay.project.user.service.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user/myPage")
public class HostBookingManagementController {

    @Autowired
    HostBookingManagementService hostBookingManagementService;

    @Autowired
    UserLoginService userLoginService;

    @Autowired
    RoomService roomService;

    @Autowired
    ProfileImgService profileImgService;

    @GetMapping("/hostbookingmanagement")
    public String bookingManagement(HttpSession session, Model model) {

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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user/myPage/hostBookingManagement";
    }

    @ResponseBody
    @PostMapping("/hostbookingmanagement")
    public List<Map<String, Object>> bookingPage(@RequestParam(required = false, defaultValue = "1") int page, HttpSession session) {
        List<Map<String, Object>> list = null;
        try {
            list = hostBookingManagementService.getBookingRequestList((String) session.getAttribute("user_id"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @ResponseBody
    @PostMapping("/hostbookingmanagement/aprv")
    public List<Map<String, Object>> approveBooking(String booking_id, String is_approve, HttpSession session) {
        List<Map<String, Object>> list = null;
        try {
            if (is_approve.equals("Y")) {
                hostBookingManagementService.approveBookingRequest(booking_id);
            } else {
                hostBookingManagementService.rejectBookingRequest(booking_id);
            }
            list = hostBookingManagementService.getBookingRequestList((String) session.getAttribute("user_id"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
