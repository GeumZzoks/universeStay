package com.universestay.project.admin.controller;

import com.universestay.project.admin.service.DashBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin/main")
public class DashBoardController {

    private final DashBoardService dashBoardService;

    @Autowired
    public DashBoardController(DashBoardService dashBoardService) {
        this.dashBoardService = dashBoardService;
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {

        Map<String, String> summaryDashBoardMap = Map.of("totalUser",
                dashBoardService.countTotalUser(), "totalHost", dashBoardService.countTotalHost(),
                "totalAccommodation", String.valueOf(dashBoardService.selectListRoom().size()),
                "totalInquiry", dashBoardService.countTotalInquiries());

        model.addAttribute("summaryDashBoardMap", summaryDashBoardMap);
        model.addAttribute("listRoom", dashBoardService.selectListRoom());
        model.addAttribute("listInquiry", dashBoardService.selectListInquiry());

        return "/admin/dashboard";
    }

    @PostMapping("/approveRoom")
    public ResponseEntity<String> approveRoom(@RequestParam("roomId") String roomId) {

        if (dashBoardService.updateConfirmIndividualRoom(roomId) == 1) {
            return ResponseEntity.ok("Y");
        }

        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("N");
    }

    @PostMapping("/rejectRoom")
    public ResponseEntity<String> rejectRoom(@RequestParam("roomId") String roomId) {

        if (dashBoardService.updateRejectIndividualRoom(roomId) == 1) {
            return ResponseEntity.ok("Y");
        }

        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("N");
    }

    @PostMapping("/assignInquiry")
    public ResponseEntity<String> assignInquiry(@RequestParam("chatting_room_id") String chatting_room_id, HttpSession session) {
        if (session.getAttribute("admin_email") == null) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("N");
        }
        Map<String, Object> map = new HashMap<>();
        map.put("chatting_room_id", chatting_room_id);
        map.put("admin_id", session.getAttribute("admin_id"));
        try {
            dashBoardService.updateInquiryStatus(map);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("N");
        }
        return ResponseEntity.ok("Y");
    }
}
