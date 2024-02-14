package com.universestay.project.inquiry.controller;

import com.universestay.project.inquiry.dto.InquiryChattingMessageDto;
import com.universestay.project.inquiry.service.AdminInquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/inquiry")
public class AdminInquiryController {

    @Autowired
    AdminInquiryService adminInquiryService;

    @GetMapping()
    public String view(HttpSession session, Model model) {
        System.out.println("*** GET *** /admin/inquiry");
        return "inquiry/adminInquiry";
    }

    @PostMapping()
    @ResponseBody
    public List<Map<String, Object>> view(HttpSession session) {
        List<Map<String, Object>> list = null;
        if (session.getAttribute("admin_id") == null) return list;
        try {
            list = adminInquiryService.getMyChattingRoomList((String) session.getAttribute("admin_id"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @ResponseBody
    @GetMapping("/{chatting_room_id}")
    public List<Map<String, Object>> chattingMessageList(@PathVariable String chatting_room_id, HttpSession session) {
        List<Map<String, Object>> list = null;
        try {
            list = adminInquiryService.getChattingMessageList(chatting_room_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @ResponseBody
    @PostMapping("/savemessage")
    public String saveMessage(String chatting_room_id, String message, HttpSession session) {
        if (session.getAttribute("admin_id") == null) {
            return "메시지 저장 실패!";
        }
        InquiryChattingMessageDto dto = new InquiryChattingMessageDto();
        dto.setChatting_room_id(chatting_room_id);
        dto.setWriter_id((String) session.getAttribute("admin_id"));
        dto.setChatting_ctt(message);
        dto.setCreated_id((String) session.getAttribute("admin_id"));
        try {
            adminInquiryService.createChattingMessage(dto);
        } catch (Exception e) {
            e.printStackTrace();
            return "메시지 저장 실패!";
        }
        return "메시지 저장 성공!";
    }
}
