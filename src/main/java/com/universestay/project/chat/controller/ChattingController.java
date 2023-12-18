package com.universestay.project.chat.controller;

import com.universestay.project.chat.service.ChatMessageService;
import com.universestay.project.chat.service.ChatRoomService;
import com.universestay.project.dto.ChattingMessageDto;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Slf4j
public class ChattingController {

    @Autowired
    ChatMessageService chatMessageService;

    @Autowired
    ChatRoomService chatRoomService;


    //채팅 저장
    @RequestMapping("/chat/insertChat.do")
    @ResponseBody
    public int insertChat(@RequestBody ChattingMessageDto insertChatDto) {
        int result = chatMessageService.insertChat(insertChatDto);
        return result;
    }

    //채팅창으로 입장
    @RequestMapping("/enter/chattingRoomList/{chatting_room_id}")
    public String enterChatRoom(Model model,
            @PathVariable String chatting_room_id,
            HttpSession session) {
        try {
            System.out.println("======chatting_room_id = " + chatting_room_id);
            String user_id = (String) session.getAttribute("user_id");
            List<Map<String, Object>> firstList = chatMessageService.selectChatList(
                    chatting_room_id);

            // 현재 로그인한 id 의 채팅방 목록 조회
            List<Map<String, Object>> chatRoomList = chatRoomService.selectChatRoomList(user_id);
            // 채팅방 목록을 하나씩 화면에 전달
            model.addAttribute("chatRoomList", chatRoomList);

            model.addAttribute("chat_room_id", chatting_room_id);
            model.addAttribute("user_id", user_id);
            model.addAttribute("firstList", firstList);
            System.out.println(firstList.toString());
            return "/chatting/chattingMessageList";
        } catch (Exception e) {
            e.printStackTrace();
            return "/chatting/chattingMessageList";
        }

    }

    //채팅 내역 가져오기
    @RequestMapping("/chat/chatList.do")
    @ResponseBody
    public List<Map<String, Object>> selectChatList(@RequestParam String chatting_room_id) {

        List<Map<String, Object>> list = chatMessageService.selectChatList(chatting_room_id);
        log.info("list= {}", list);
        return list;
    }


    // 채팅 메세지 전달
    @MessageMapping("/hello/{chat_room_id}")
    @SendTo("/subscribe/chat/{chat_room_id}")
    public ChattingMessageDto broadcasting(ChattingMessageDto chat) {

        log.debug("받아온 data={}", chat);

        return chat;
    }


}
