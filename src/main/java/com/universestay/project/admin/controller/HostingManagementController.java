package com.universestay.project.admin.controller;

import com.universestay.project.admin.service.HostingManagementService;
import com.universestay.project.dto.RoomDto;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/hostingManagement")
public class HostingManagementController {

    @Autowired
    HostingManagementService hostingManagementService;

    @GetMapping()
    public String list(HttpServletRequest request, Model model) {
        try {
            List<RoomDto> list = hostingManagementService.list();
            model.addAttribute("list", list);
        } catch (Exception e) {
            // TODO:숙소 목록 조회 실패시 에러 알림 추가
            e.printStackTrace();
            // 목록 조회 실패시 이전페이지로 이동
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;

        }
        return "admin/hostingManagement";
    }
}
