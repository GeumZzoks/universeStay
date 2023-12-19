package com.universestay.project.chat.dao;

import com.universestay.project.dto.ChattingMessageDto;
import java.util.List;
import java.util.Map;

public interface ChatMessageDao {

    int insertChat(ChattingMessageDto chattingMessageDto);

    List<Map<String, Object>> selectChatList(String chat_room_id);

    List<Map<String, Object>> recentlyChatMessage(String chat_room_id);

    List<Map<String, Object>> selectTwoUsername(String chat_room_id);


}
