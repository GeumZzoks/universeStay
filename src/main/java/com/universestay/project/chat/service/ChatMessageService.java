package com.universestay.project.chat.service;

import com.universestay.project.dto.ChattingMessageDto;
import java.util.List;
import java.util.Map;

public interface ChatMessageService {

    int insertChat(ChattingMessageDto chattingMessageDto);

    List<ChattingMessageDto> selectChatList(Map<String, Object> map);

    List<ChattingMessageDto> selectFirstChatList(String chat_room_id);
}
