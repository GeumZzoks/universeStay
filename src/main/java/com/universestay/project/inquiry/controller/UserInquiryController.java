package com.universestay.project.inquiry.controller;

import com.universestay.project.inquiry.dto.InquiryChattingMessageDto;
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
        System.out.println("session = " + session.getAttribute("user_id"));
        for(Map<String, Object> dto : list){
            System.out.println("dto = " + dto);
        }
        return list;
    }

    @ResponseBody
    @GetMapping("/{chatting_room_id}")
    public List<InquiryChattingMessageDto> ChattingMessageList(@PathVariable String chatting_room_id, HttpSession session) {
        System.out.println("*** GET *** /user/myPage/inquiry/{chatting_room_id}");
        List<InquiryChattingMessageDto> list = null;
        try {
            String user_id = userInquiryService.getUserId(chatting_room_id);
            if (!(session.getAttribute("user_id").equals(user_id))) {
                return list;
            }
            list = userInquiryService.getChattingMessageList(chatting_room_id);
            for(InquiryChattingMessageDto dto : list){
                System.out.println("dto = " + dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @MessageMapping("/inquiry/{chatting_room_id}")
    @SendTo("/subscribe/inquiry/{chatting_room_id}")
    public String broadcasting(@DestinationVariable String chatting_room_id, @Payload String message) {
        System.out.println("얄루");
        System.out.println("11111111111");
        System.out.println("aaaaaaaaaaa");
//        Map<String, Object>
        //        List<Map<String, Object>> chattingMessage = chatMessageService.recentlyChatMessage(
//                chatting_room_id);
//        return chattingMessage.get(0);
        return message;
    }


}
