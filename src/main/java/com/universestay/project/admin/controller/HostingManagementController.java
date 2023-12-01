package com.universestay.project.admin.controller;

import com.universestay.project.admin.dto.HostingManagementDto;
import com.universestay.project.admin.service.HostingManagementService;
import com.universestay.project.dto.RoomDto;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/hostingManagement")
public class HostingManagementController {

    @Autowired
    HostingManagementService hostingManagementService;

    @GetMapping()
    public String list(HttpServletRequest request, Model model) {
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


