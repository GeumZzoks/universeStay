package com.universestay.project.chat.controller;

import com.universestay.project.chat.service.ChatMessageService;
import com.universestay.project.dto.ChattingMessageDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Slf4j
public class ChattingController {

    @Autowired
    ChatMessageService chatMessageService;


    //채팅 저장
    @RequestMapping("/chat/insertChat.do")
    @ResponseBody
    public int insertChat(@RequestBody ChattingMessageDto insertChatDto) {
        System.out.println("room_id = " + insertChatDto.getChatting_room_id());
//        chat.setChatting_room_id(chatting_room_id);
        System.out.println("user_id = " + insertChatDto.getUser_id());
        System.out.println("chat_ctt = " + insertChatDto.getChat_ctt());

        int result = chatMessageService.insertChat(insertChatDto);
        return result;
    }


}
