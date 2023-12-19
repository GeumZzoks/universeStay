package com.universestay.project.chat.service;

import com.universestay.project.dto.ChattingMessageDto;
import java.util.List;
import java.util.Map;

public interface ChatMessageService {

    int insertChat(ChattingMessageDto chattingMessageDto);

    List<Map<String, Object>> selectChatList(String chat_room_id);

    List<Map<String, Object>> recentlyChatMessage(String chat_room_id);
}
