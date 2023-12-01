package com.universestay.project.admin.controller;

import com.universestay.project.admin.dto.HostingManagementDto;
import com.universestay.project.admin.service.HostingManagementService;
import com.universestay.project.dto.RoomDto;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @ResponseBody
    public String update(@RequestBody HostingManagementDto hostingManagementDto) {
        String status_id = hostingManagementDto.getStatus();
        String[] roomIdList = hostingManagementDto.getRoom_id();

        System.out.println("status = " + hostingManagementDto.getStatus());
        System.out.println("test = " + Arrays.toString(roomIdList));

        try {
            hostingManagementService.updateRoomStatus(status_id, roomIdList);
        } catch (Exception e) {
            // TODO:숙소 목록 조회 실패시 에러 알림 추가
            e.printStackTrace();
            // 목록 조회 실패시 호스팅관리 페이지로 이동
            return "redirect:admin/hostingManagement";
        }

        return "";
    }
}


