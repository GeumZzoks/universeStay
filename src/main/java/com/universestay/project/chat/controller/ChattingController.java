package com.universestay.project.chat.controller;

import com.universestay.project.chat.service.ChatMessageService;
import com.universestay.project.chat.service.ChatRoomService;
import com.universestay.project.dto.ChattingMessageDto;
import com.universestay.project.room.service.RoomService;
import com.universestay.project.user.dao.UserWithdrawalDao;
import com.universestay.project.user.dto.UserDto;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
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

    @Autowired
    UserWithdrawalDao userWithdrawalDao;

    @Autowired
    RoomService roomService;


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
            @RequestParam(name = "room_id", required = false) String room_id,
            HttpSession session) {
        try {
            String user_id = (String) session.getAttribute("user_id");
            // 채팅방에 입장하면서 채팅 내역을 가져온다.
            List<Map<String, Object>> firstList = chatMessageService.selectChatList(
                    chatting_room_id);

            for (int i = 0; i < firstList.size(); i++) {
                Map<String, Object> chat = firstList.get(i);
                LocalDateTime chatDateTime = ((Timestamp) chat.get("chat_date")).toLocalDateTime();

                ZoneId sourceZone = ZoneId.of("UTC");
                ZoneId targetZone = ZoneId.of("Asia/Seoul");
                LocalDateTime adjustedChatDateTime = chatDateTime.atZone(sourceZone)
                        .withZoneSameInstant(targetZone)
                        .toLocalDateTime();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                String chat_date = adjustedChatDateTime.format(formatter);

                chat.put("chat_date", chat_date);
            }

            String chat_room_id = chatting_room_id;
            Map<String, Object> room = roomService.lookUpRoom(room_id, user_id);
            UserDto host = userWithdrawalDao.selectUserByUuid(room.get("user_id").toString());

            // 채팅방 id 를 통해 채팅방의 참여자 목록을 가져온다.
            List<Map<String, Object>> twoUsername = chatMessageService.selectTwoUsername(
                    chat_room_id);

            // 현재 로그인한 id 의 채팅방 목록 조회
            List<Map<String, Object>> chatRoomList = chatRoomService.selectChatRoomList(user_id);

            // 채팅방 목록의 "chat_date" 값을 9시간 더한 값(한국시)으로 변경
            for (int i = 0; i < chatRoomList.size(); i++) {
                Map<String, Object> chatRoom = chatRoomList.get(i);

                // Timestamp to String
                LocalDateTime chatDateTime = ((Timestamp) chatRoom.get(
                        "chat_date")).toLocalDateTime();

                ZoneId sourceZone = ZoneId.of("UTC");
                ZoneId targetZone = ZoneId.of("Asia/Seoul");
                LocalDateTime adjustedChatDateTime = chatDateTime.atZone(sourceZone)
                        .withZoneSameInstant(targetZone)
                        .toLocalDateTime();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                String chat_date = adjustedChatDateTime.format(formatter);

                chatRoom.put("chat_date", chat_date);
            }

            // 채팅방 목록을 하나씩 화면에 전달
            model.addAttribute("chatRoomList", chatRoomList);
            model.addAttribute("host", host);
            model.addAttribute("chat_room_id", chat_room_id);
            model.addAttribute("user_id", user_id);
            model.addAttribute("firstList", firstList);
            model.addAttribute("twoUsername", twoUsername);
            return "/chatting/chattingMessageList";
        } catch (Exception e) {
            e.printStackTrace();
            return "/chatting/chattingMessageList";
        }

    }

    //채팅 내역 가져오기
    @RequestMapping("/chat/chatList.do/{chat_room_id}")
    @ResponseBody
    public List<Map<String, Object>> selectChatList(@RequestParam String chatting_room_id) {

        List<Map<String, Object>> list = chatMessageService.selectChatList(chatting_room_id);
        log.info("list= {}", list);
        return list;
    }


    // 채팅 메세지 전달
    @MessageMapping("/hello/{chat_room_id}")
    @SendTo("/subscribe/chat/{chat_room_id}")
    public Map<String, Object> broadcasting(@DestinationVariable String chat_room_id) {
        List<Map<String, Object>> chattingMessage = chatMessageService.recentlyChatMessage(
                chat_room_id);

        return chattingMessage.get(0);
    }


}
