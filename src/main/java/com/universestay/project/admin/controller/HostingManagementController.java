package com.universestay.project.admin.controller;

import com.universestay.project.admin.dto.HostingManagementDto;
import com.universestay.project.admin.service.HostingManagementService;
import com.universestay.project.room.dto.RoomDto;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/hostingManagement")
public class HostingManagementController {

    @Autowired
    HostingManagementService hostingManagementService;

    /**
     * @param request
     * @param model
     * @return viewName
     * @feat : 모든 숙소 리스트 조회하는 메서드
     */
    @GetMapping()
    public String listAll(HttpServletRequest request, Model model) {
        try {
            List<RoomDto> roomList = hostingManagementService.list();
            model.addAttribute("roomList", roomList);
        } catch (Exception e) {
            // TODO:숙소 목록 조회 실패시 에러 알림 추가
            e.printStackTrace();
            // 목록 조회 실패시 이전페이지로 이동
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;

        }
        return "admin/hostingManagement";
    }

    /**
     * @param requestData
     * @return ResponseEntity
     * @feat : 검색조건에 맞는 숙소 리스트 보여줌
     */
    @PostMapping()
    @ResponseBody
    public ResponseEntity<List<RoomDto>> list(@RequestBody Map<String, String> requestData) {
        try {
            String statusId = requestData.get("status_id");
            String roomName = requestData.get("room_name");

            List<RoomDto> roomList = hostingManagementService.searchRoomList(statusId, roomName);
            return new ResponseEntity<>(roomList, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * @param hostingManagementDto
     * @return ResponseEntity
     * @feat : 선택된 숙소들 숙소 승인 상태 업데이트
     */
    @PutMapping()
    public ResponseEntity<String> update(@RequestBody HostingManagementDto hostingManagementDto) {
        String status_id = hostingManagementDto.getStatus();
        String[] roomIdList = hostingManagementDto.getRoom_id();

        try {
            hostingManagementService.updateRoomStatus(status_id, roomIdList);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("error", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return new ResponseEntity<>("ok", HttpStatus.OK);
    }
}
