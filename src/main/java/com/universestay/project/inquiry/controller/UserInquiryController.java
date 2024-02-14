package com.universestay.project.inquiry.controller;

import com.universestay.project.inquiry.dto.InquiryChattingMessageDto;
import com.universestay.project.inquiry.dto.InquiryChattingRoomDto;
import com.universestay.project.inquiry.service.UserInquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/user/myPage/inquiry")
public class UserInquiryController {

    @Autowired
    UserInquiryService userInquiryService;

    @GetMapping()
    public String view(HttpSession session, Model model) {
        System.out.println("*** GET *** /user/myPage/inquiry");
        return "inquiry/userInquiry";
    }


    @ResponseBody
    @PostMapping()
    public List<Map<String, Object>> ChattingRoomList(HttpSession session) {
        System.out.println("*** POST *** /user/myPage/inquiry");
        List<Map<String, Object>> list = null;
        try {
            list = userInquiryService.getSimpleChattingRoomList((String) session.getAttribute("user_id"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @ResponseBody
    @GetMapping("/{chatting_room_id}")
    public List<Map<String, Object>> ChattingMessageList(@PathVariable String chatting_room_id, HttpSession session) {
        System.out.println("*** GET *** /user/myPage/inquiry/{chatting_room_id}");
        List<Map<String, Object>> list = null;
        try {
            String user_id = userInquiryService.getUserId(chatting_room_id);
            if (!(session.getAttribute("user_id").equals(user_id))) {
                return list;
            }
            list = userInquiryService.getChattingMessageList(chatting_room_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @PostMapping("/insert")
    public String insertInquiry(HttpSession session) {
        if (session.getAttribute("user_id") != null) {
            String uuid = UUID.randomUUID().toString();
            InquiryChattingRoomDto dto = new InquiryChattingRoomDto();
            dto.setChatting_room_id(uuid);
            dto.setUser_id((String) session.getAttribute("user_id"));
            dto.setCreated_id((String) session.getAttribute("user_id"));
            dto.setUpdated_id((String) session.getAttribute("user_id"));
            try {
                userInquiryService.createChattingRoom(dto);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "redirect:/user/myPage/inquiry";
    }

    @ResponseBody
    @PostMapping("/savemessage")
    public String saveMessage(String chatting_room_id, String message, String writer_id, HttpSession session) {
        if (session.getAttribute("user_id") == null) {
            return "메시지 저장 실패!";
        }
        InquiryChattingMessageDto dto = new InquiryChattingMessageDto();
        dto.setChatting_room_id(chatting_room_id);
        dto.setWriter_id((String) session.getAttribute("user_id"));
        dto.setChatting_ctt(message);
        dto.setCreated_id((String) session.getAttribute("user_id"));
        try {
            userInquiryService.createChattingMessage(dto);
        } catch (Exception e) {
            e.printStackTrace();
            return "메시지 저장 실패!";
        }
        return "메시지 저장 성공!";
    }

    @MessageMapping("/inquiry/{chatting_room_id}")
    @SendTo("/subscribe/inquiry/{chatting_room_id}")
    public String broadcasting(@DestinationVariable String chatting_room_id, @Payload String message, String writer_id) {
        return message;
    }
}
