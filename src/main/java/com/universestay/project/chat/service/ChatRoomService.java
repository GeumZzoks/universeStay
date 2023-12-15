package com.universestay.project.chat.service;

import com.universestay.project.dto.ChattingRoomDto;
import java.util.List;
import java.util.Map;

public interface ChatRoomService {

    int createRoom(ChattingRoomDto chattingRoomDto);

    ChattingRoomDto selectChatRoom(ChattingRoomDto chattingRoomDto) throws Exception;

    String selectChatRoomId(ChattingRoomDto chattingRoomDto) throws Exception;

    List<Map<String, Object>> selectChatRoomList(String userId) throws Exception;
}